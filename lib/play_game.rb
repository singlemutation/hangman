# frozen_string_literal:true

require 'json'
require_relative 'word_picker'
require_relative 'basic_serializable'

# Play game
class PlayGame
  include BasicSerializable
  def initialize(game)
    @count = game.count
    @bad_letters = game.bad_letters
    @word = game.word
    @masked_word = game.masked_word
    play_round
  end

  def player_guess
    puts 'Your guess?'
    @guess = gets.chomp
    save_game if @guess == 'save'
  end

  def unmask
    @word.split('').map.with_index do |v, i|
      @masked_word[i] = @guess if v == @guess
    end
  end

  def counter
    return if @guess == 'save'
    return if @word.include? @guess

    @count -= 1
    @bad_letters.push(@guess)
  end

  def play_round
    until @count.zero?
      puts "#{@count} limbs remain"
      p @masked_word
      player_guess
      break if @guess == 'save'

      unmask
      counter
      puts "Wrong guesses #{@bad_letters}"
      break if game_won

      puts "You lose! The word was #{@word}!" if @count.zero?
    end
  end

  def game_won
    return unless @word == @masked_word.join

    p @masked_word
    puts "You guessed the word #{@word}!"
    true
  end

  def save_game
    hash = JSON.dump({
                       word: @word,
                       masked_word: @masked_word,
                       count: @count,
                       bad_letters: @bad_letters
                     })
    File.open('lib/save_games.json', 'w') do |file|
      file.write(hash)
    end
    puts 'Game saved'
  end

  def load_game
    File.open('save_games.json', 'r') do |file|
    end
  end
end

# save_game method
# store @secret_word.word and @secretword.masked_word
# store @count
# store @bad_letters
#
# load_game method
# load the stored values back into the game

# PlayGame.new
