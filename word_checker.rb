require 'pry'
require 'digest'

class WordChecker
  attr_reader :word_list

  def initialize
    @word_list = create_word_list
  end

  def anagramify(word)
    # make a list of possible words out of letter combinations
    letters = word.downcase.split('')

    (2..letters.count).map do |x|
      letters.combination(x).to_a
    end.flatten(1).uniq.map { |word| word.join('') }
  end

  def create_word_list
    File.readlines('words.txt').inject({}) do |hash, word|
      word_hash = word.chomp.split('').sort.join
      hash[word_hash] ||= []
      hash[word_hash] << word.chomp
      hash
    end
  end

  def find_words(tiles)
    # build anagrams of tiles into a validated word list
    anagramify(tiles).inject([]) do |arr, word|
      # sort the letters of the word alphabetically
      word_hash = word.split('').sort.join

      # find the entry in our word list that contains all words
      # made of of the letters contained in our word hash
      # shove that array of words into my return array
      arr << word_list[word_hash]
    end.compact.flatten.uniq
  end

  def find_words_including(tiles, inclusion, space_before, space_after)
    potentials = find_words("#{tiles}#{inclusion}")
    filtered = potentials.select do |word|
      word.match?(/^.{0,#{space_before}}#{inclusion}.{0,#{space_after}}$/)
    end
  end
end

# wordchecker = WordChecker.new
# loop do
#   print "gimmea  letters: "
#   letters = gets.chomp
#   exit if letters == "exit"
#
#   print "gimmea letter to include in the word: "
#   inclusion = gets.chomp
#
#   print "how many letters can come before the inclusion: "
#   pre = gets.chomp
#
#   print "how many letters can come after the inclusion: "
#   post = gets.chomp
#
#   puts wordchecker.find_words_including(letters, inclusion, pre, post)
# end
