require_relative './test_helper'
require './lib/board'

class BoardTest < Minitest::Test
  def test_it_creates_a_15_x_15_board
    board = Board.new

    board.board.each do |row|
      row.each do |column|
        assert_instance_of Cell, column
      end
    end
  end
end
