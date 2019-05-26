require_relative 'board'

class Display
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def show_board
    print "-" * 60
    print "\n|"
    board.board.each do |row|
      row.each do |column|
        print " #{column.value} |"
      end

      print "\n"
      print "-" * 60
      print "\n|"
    end
  end
end
