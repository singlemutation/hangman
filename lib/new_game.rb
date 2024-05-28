# frozen_string_literal: true

require_relative 'word_picker'
# Stores game variables in an object
class NewGame
  def initialize
    @secret_word = WordPicker.new
    @word = @secret_word.word
    @masked_word = @secret_word.masked_word
    @count = 6
    @bad_letters = []
  end

  attr_reader :word, :count, :bad_letters, :masked_word
end
