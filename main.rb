# frozen_string_literal:true

require_relative 'lib/word_picker'
require_relative 'lib/play_game'
require_relative 'lib/new_game'
require_relative 'lib/load_game'

puts "Let's play hangman!"
puts 'Would you like to play a new game or load the previous game?'
@new_or_load = gets.chomp.downcase
PlayGame.new(NewGame.new) if @new_or_load == 'new'
PlayGame.new(LoadGame.new) if @new_or_load == 'load'

# PlayGame.new
