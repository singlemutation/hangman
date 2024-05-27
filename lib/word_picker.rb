# frozen_string_literal:true

# Open the txt file and pick a random word that is the right length
class WordPicker
  attr_reader :word

  def pick_word
    words = File.read('google-10000-english-no-swears.txt').split
    game_words = []
    words.each do |line|
      game_words.push(line) if line.length > 4 && line.length < 13
    end
    game_words.sample.to_s
  end
end
