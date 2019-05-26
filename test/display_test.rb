require_relative './test_helper'
require './lib/display'

class DisplayTest < Minitest::Test
  attr_reader :display

  def setup
    @display = Display.new
  end

  def test_it_creates_a_new_board_on_init
    assert_instance_of Board, display.board
  end

  def test_it_can_show_the_board
    display.show_board
  end
end
