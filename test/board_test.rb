require_relative './test_helper'
require './lib/board'

class BoardTest < Minitest::Test
  def test_it_creates_a_15_x_15_board
    board = Board.new
    assert_equal 15, board.board.count

    board.board.each do |row|
      assert_equal 15, row.count
      
      row.each do |column|
        assert_instance_of Cell, column
      end
    end
  end
end
