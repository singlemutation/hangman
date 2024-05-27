# frozen_string_literal:true

# Open the txt file and pick a random word that is the right length
class WordPicker
  def initialize
    @word = pick_word
    @masked_word = letters_to_blanks(@word)
  end
  attr_reader :word, :masked_word

  def pick_word
    words = File.read('google-10000-english-no-swears.txt').split
    game_words = []
    words.each do |line|
      game_words.push(line) if line.length > 4 && line.length < 13
    end
    game_words.sample.to_s
  end

  def letters_to_blanks(word)
    word.split('').map { |_letter| _letter = '_' }
  end
end

# secret_word = WordPicker.new
# puts secret_word.word
# p secret_word.masked_word
