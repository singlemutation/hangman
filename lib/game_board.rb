# frozen_string_literal:true

require_relative 'word_picker'

# Turn word into game board
class GameBoard
  def initialize
  end

  def letters_to_blanks(word)
    word.split('').map { |letter| letter = '_' }
  end
end

GameBoard.new
