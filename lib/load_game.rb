# frozen_string_literal: true

require 'json'
# Creates game from JSON
class LoadGame
  def initialize
    from_json
  end

  attr_reader :bad_letters, :count, :word, :masked_word

  def from_json
    file = File.read('lib/save_games.json')
    data_hash = JSON.parse(file)
    @bad_letters = data_hash['bad_letters']
    @count = data_hash['count']
    @word = data_hash['word']
    @masked_word = data_hash['masked_word']
  end
end

# p LoadGame.from_json
