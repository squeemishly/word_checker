require_relative 'cell'

class Board
  attr_reader :board
  
  def initialize
    @board = build
  end

  def build
    rows = ("A".."Z").to_a
    grid = Array.new(15) { Array.new(15) { '' } }

    15.times do |row|
      15.times do |column|
        cell_row = rows[row]
        cell_column = column + 1
        cell = Cell.new(cell_row, cell_column)
        grid[row][column] = cell
      end
    end
    grid
  end
end
