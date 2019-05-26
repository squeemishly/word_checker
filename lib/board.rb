require_relative 'cell'

class Board
  attr_reader :board

  def initialize
    @board = build
  end

  def build
    grid = Array.new(15) { Array.new(15) { '' } }
    add_cells_to_grid(grid)
  end

  def play(letter, row, column)
    rows = ("A".."Z").to_a
    board[rows.find_index(row)][column - 1].value = letter
  end

  private

    def add_cells_to_grid(grid)
      15.times do |row|
        15.times do |column|
          create_cells(row, column, grid)
        end
      end

      grid
    end

    def create_cells(row, column, grid)
      rows = ("A".."Z").to_a

      cell_row = rows[row]
      cell_column = column + 1
      cell = Cell.new(cell_row, cell_column)
      grid[row][column] = cell
    end
end
