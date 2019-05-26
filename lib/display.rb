require_relative 'board'

class Display
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def show_board
    print "    "
    for x in 1..8 do
      print "#{x}   "
    end

    for x in 9..15 do
      print "#{x}  "
    end

    print "\n"

    print "  "
    print "-" * 61
    print "\n"
    board.board.each do |row|
      print "#{row[0].row} |"
      row.each do |column|
        print " #{column.value} |"
      end

      print "\n"
      print " " * 2
      puts "-" * 61
    end
  end
end
