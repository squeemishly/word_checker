require_relative 'display'

class Game
  attr_reader :display

  def initialize
    @display = Display.new
  end

  def run
    puts `clear`
    puts "Welcome to Scrabble Cheater!"
    display.show_board
    puts "Press enter when you’re ready"
    gets

    while true
      puts `clear`
      display.show_board
      play
    end
  end

  def play
    puts "Please enter a tile letter"
    letter = gets.chomp
    puts "Please enter the row letter"
    row = gets.chomp.upcase
    puts "Please enter the column number"
    column = gets.chomp.to_i
    display.board.play(letter, row, column)
    display.show_board
  end
end
