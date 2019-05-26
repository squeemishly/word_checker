require_relative 'board'

class Display
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def show_board
    print "    "
    column_headings
    row_boundary
    fill_in_board
  end

  private

    def column_headings
      for x in 1..8 do
        print "#{x}   "
      end

      for x in 9..15 do
        print "#{x}  "
      end
    end

    def row_boundary
      print "\n  "
      puts "-" * 61
    end

    def fill_in_board
      board.board.each do |row|
        print "#{row[0].row} |"
        row.each do |column|
          print " #{column.value} |"
        end

        row_boundary
      end
    end
end
