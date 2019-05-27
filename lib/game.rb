require_relative 'display'
require_relative 'word_checker'

class Game
  attr_reader :display,
              :word_checker

  def initialize
    @display = Display.new
    @word_checker = WordChecker.instance
  end

  def run
    puts `clear`
    answer = welcome_message.downcase

    while invalid_response(answer)
      exit if answer == "exit" || answer == "a" || answer == "abort"
      puts `clear`
      puts "I'm sorry, please select from (b)uild or (c)heck".colorize(:red)
      answer = welcome_message.downcase
    end

    if answer == "b" || answer == "build"
      loop do
        build_board
      end
    elsif answer == "c" || answer == "check"
      loop do
        find_words
      end
    end
  end

  private

    def build_board
      puts `clear`
      puts "Type 'exit' to return to the home screen".colorize(:red)
      display.show_board

      puts "Please enter a tile letter"
      letter = gets.chomp.downcase
      run if letter == "exit"

      puts "Please enter the cell address, row letter followed by column number, e.g.: A1"
      address = gets.chomp.downcase
      run if address == "exit"

      row = address[0].upcase
      column = address[1..-1].to_i
      display.board.play(letter, row, column)
    end

    def welcome_message
      puts "Welcome to Scrabble Cheater!"
      puts "Type 'exit' at any time to leave the program"
      display.show_board

      puts "What would you like to do?"
      puts "(a)bort this game"
      puts "(b)uild a board"
      puts "(c)heck your word options"
      gets.chomp
    end

    def find_words
      puts "gimmea  letters: "
      letters = gets.chomp
      run if letters == "exit"

      puts "gimmea letter to include in the word: "
      puts "press enter if you don't have an inclusion"
      inclusion = gets.chomp

      puts "how many letters can come before the inclusion: "
      puts "press enter if you don't have an inclusion"
      pre = gets.chomp

      puts "how many letters can come after the inclusion: "
      puts "press enter if you don't have an inclusion"
      post = gets.chomp

      puts word_checker.find_words_including(letters, inclusion, pre, post)
    end

    def invalid_response(answer)
      answer != "b" && answer != "build" && answer != "c" && answer != "check"
    end
end
