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
      play
    end
  end

  def play
    display.show_board
    puts "Please enter a tile letter"
    letter = gets.chomp
    puts "Please enter the cell address, row letter followed by column number, e.g.: A1"
    address = gets.chomp
    row = address[0].upcase
    column = address[1..-1].to_i
    display.board.play(letter, row, column)
  end
end
