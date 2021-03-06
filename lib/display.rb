require_relative 'board'
require 'colorize'

class Display
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def show_board
    column_headings
    row_boundary
    fill_in_board
  end

  private

    CELL_COLORS = {
      "3W": {color: :magenta, background: :light_red},
      "3L": {color: :blue, background: :light_cyan},
      "2W": {color: :red, background: :light_magenta},
      "2L": {color: :cyan, background: :light_blue}
    }

    def column_headings
      print "    "
      for x in 1..8 do
        print " #{x}   "
      end

      for x in 9..15 do
        print " #{x}  "
      end
    end

    def row_boundary
      print "\n  "
      puts "-" * 76
    end

    def fill_in_board
      board.board.each do |row|
        print "#{row[0].row} |"
        row.each do |column|
          if column.value != " "
            print " #{column.value.colorize(:yellow)}  |"
          elsif column.multiplier
            print " #{column.multiplier} ".colorize(CELL_COLORS[column.multiplier.to_sym]) + "|"
          else
            print "    |"
          end
        end

        row_boundary
      end
    end
end
