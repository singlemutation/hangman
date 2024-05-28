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
    @secret_word = game.secret_word
    play_round
  end

  def player_guess
    puts 'Your guess?'
    @guess = gets.chomp
    save_game if @guess == 'save'
  end

  def unmask
    @secret_word.word.split('').map.with_index do |v, i|
      @secret_word.masked_word[i] = @guess if v == @guess
    end
  end

  def counter
    return if @guess == 'save'
    return if @secret_word.word.include? @guess

    @count -= 1
    @bad_letters.push(@guess)
  end

  def play_round
    until @count.zero?
      puts "#{@count} limbs remain"
      p @secret_word.masked_word
      player_guess
      break if @guess == 'save'

      unmask
      counter
      puts "Wrong guesses #{@bad_letters}"
      break if game_won

      puts "You lose! The word was #{@secret_word.word}!" if @count.zero?
    end
  end

  def game_won
    return unless @secret_word.word == @secret_word.masked_word.join

    p @secret_word.masked_word
    puts "You guessed the word #{@secret_word.word}!"
    true
  end

  def save_game
    hash = JSON.dump({
                       word: @secret_word.word,
                       masked_word: @secret_word.masked_word,
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
