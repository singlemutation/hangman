# frozen_string_literal:true

require_relative 'word_picker'

# Play game
class PlayGame
  def initialize
    @count = 6
    @bad_letters = []
    @secret_word = WordPicker.new
    play_round
  end

  def player_guess
    puts 'Your guess?'
    @guess = gets.chomp
  end

  def unmask
    @secret_word.word.split('').map.with_index do |v, i|
      @secret_word.masked_word[i] = @guess if v == @guess
    end
  end

  def counter
    return if @secret_word.word.include? @guess

    @count -= 1
    @bad_letters.push(@guess)
  end

  def play_round
    until @count.zero?
      puts "#{@count} limbs remain"
      p @secret_word.masked_word
      player_guess
      unmask
      counter
      puts "Wrong guesses #{@bad_letters}"
      break if game_won

      puts 'You lose!' if @count.zero?
    end
  end

  def game_won
    return unless @secret_word.word == @secret_word.masked_word.join

    p @secret_word.masked_word
    puts "You guessed the word #{@secret_word.word}!"
    true
  end
end

# Counter == 6 body parts
# Get player guess
# If player @guess is in @word, replace _ in @masked_word with @guess
# If player guess is wrong, remove 1 from counter
# If counter gets to 0, player loses
# If @masked word == @word, player wins
