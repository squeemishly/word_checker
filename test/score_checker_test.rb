require_relative './test_helper'
require './lib/score_checker'

class ScoreCheckerTest < Minitest::Test
  def test_it_can_calculate_the_base_value_of_a_word
    sc = ScoreChecker.new

    assert_equal 2, sc.calculate_score("as")
    assert_equal 9, sc.calculate_score("thing")
  end
end
