require_relative './test_helper'
require './lib/cell'

class CellTest < Minitest::Test
  attr_reader :cell

  def setup
    @cell = Cell.new("A", 1)
  end

  def test_init_values
    assert_equal " ", cell.value
    assert_equal "A", cell.row
    assert_equal 1, cell.column
    refute cell.multiplier
  end

  def test_the_value_can_be_updated_to_a_letter
    cell.add_value("a")

    assert_equal "a", cell.value
    assert_raises RuntimeError do
      cell.add_value("ab")
    end
  end

  def test_it_has_an_address
    assert_equal "A", cell.row
    assert_equal 1, cell.column
  end
end
