# frozen_string_literal:true

require_relative 'word_picker'

# Turn word into game board
class GameBoard
  def initialize
    @word = WordPicker.new.pick_word
    p @word
    @masked_word = letters_to_blanks(@word)
    p @masked_word
  end

  def letters_to_blanks(word)
    word.split('').map { |letter| letter = '_' }
  end
end

GameBoard.new
