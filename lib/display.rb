require_relative 'board'

class Display
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def show_board
    print "-" * 61
    print "\n|"
    board.board.each do |row|
      row.each do |column|
        print " #{column.value} |"
      end

      print "\n"
      puts "-" * 61
      print "|" if row[0].row != "O"
    end
  end
end
