require_relative 'cell'

class Board
  attr_reader :board

  def initialize
    @board = build
  end

  def build
    grid = Array.new(15) { Array.new(15) { '' } }
    add_cells_to_grid(grid)
    add_multiplier_to_cells(grid)
    grid
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

    def add_multiplier_to_cells(grid)
      grid[0][0].multiplier = "3W"
      grid[0][3].multiplier = "2L"
      grid[0][7].multiplier = "3W"
      grid[0][11].multiplier = "2L"
      grid[0][14].multiplier = "3W"

      grid[1][1].multiplier = "2W"
      grid[1][5].multiplier = "3L"
      grid[1][9].multiplier = "3L"
      grid[1][13].multiplier = "2W"

      grid[2][2].multiplier = "2W"
      grid[2][6].multiplier = "2L"
      grid[2][8].multiplier = "2L"
      grid[2][12].multiplier = "2W"

      grid[3][0].multiplier = "2L"
      grid[3][3].multiplier = "2W"
      grid[3][7].multiplier = "2L"
      grid[3][11].multiplier = "2W"
      grid[3][14].multiplier = "2L"

      grid[4][4].multiplier = "2W"
      grid[4][10].multiplier = "2W"

      grid[5][1].multiplier = "3L"
      grid[5][5].multiplier = "3L"
      grid[5][9].multiplier = "3L"
      grid[5][13].multiplier = "3L"

      grid[6][2].multiplier = "2L"
      grid[6][6].multiplier = "2L"
      grid[6][8].multiplier = "2L"
      grid[6][12].multiplier = "2L"

      grid[7][0].multiplier = "3W"
      grid[7][3].multiplier = "2L"
      grid[7][7].multiplier = "2W"
      grid[7][11].multiplier = "2L"
      grid[7][14].multiplier = "3W"

      grid[8][2].multiplier = "2L"
      grid[8][6].multiplier = "2L"
      grid[8][8].multiplier = "2L"
      grid[8][12].multiplier = "2L"

      grid[9][1].multiplier = "3L"
      grid[9][5].multiplier = "3L"
      grid[9][9].multiplier = "3L"
      grid[9][13].multiplier = "3L"

      grid[10][4].multiplier = "2W"
      grid[10][10].multiplier = "2W"

      grid[11][0].multiplier = "2L"
      grid[11][3].multiplier = "2W"
      grid[11][7].multiplier = "2L"
      grid[11][11].multiplier = "2W"
      grid[11][14].multiplier = "2L"

      grid[12][2].multiplier = "2W"
      grid[12][6].multiplier = "2L"
      grid[12][8].multiplier = "2L"
      grid[12][12].multiplier = "2W"

      grid[13][1].multiplier = "2W"
      grid[13][5].multiplier = "3L"
      grid[13][9].multiplier = "3L"
      grid[13][13].multiplier = "2W"

      grid[14][0].multiplier = "3W"
      grid[14][3].multiplier = "2L"
      grid[14][7].multiplier = "3W"
      grid[14][11].multiplier = "2L"
      grid[14][14].multiplier = "3W"
    end
end
