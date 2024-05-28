# frozen_string_literal: true

require_relative 'word_picker'
# Stores game variables in an object
class Game
  def initialize(secretword, count, badletters)
    @secret_word = secretword
    @count = count
    @bad_letters = badletters
  end

  attr_reader :secret_word, :count, :bad_letters
end
