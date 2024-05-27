# frozen_string_literal:true

# Open the txt file and pick a random word that is the right length
class WordPicker
  def initialize
    @word = pick_word
  end

  attr_reader :word

  def pick_word
    words = File.readlines('google-10000-english-no-swears.txt').map(&:chomp)
    game_words = []
    words.each do |line|
      game_words.push(line) if line.length > 4 && line.length < 13
    end
    game_words.sample(1)
  end
end

@new_word = WordPicker.new
