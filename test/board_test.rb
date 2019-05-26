require_relative './test_helper'
require './lib/board'

class BoardTest < Minitest::Test
  attr_reader :board

  def setup
    @board = Board.new
  end

  def test_it_creates_a_15_x_15_board
    assert_equal 15, board.board.count

    board.board.each do |row|
      assert_equal 15, row.count

      row.each do |column|
        assert_instance_of Cell, column
      end
    end
  end

  def test_it_can_add_tiles_to_specific_cells
    board.play("a", "B", 4)

    assert_equal "a", board.board[1][3].value
  end
end
