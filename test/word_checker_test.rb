require_relative './test_helper'
require './lib/word_checker'

class WordCheckerTest < Minitest::Test
  attr_reader :wc

  def setup
    @wc = WordChecker.instance
  end

  def test_it_creates_a_wordlist_on_init
    assert_instance_of Hash, wc.word_list
    assert_equal ["ahs", "ash", "has", "sha"], wc.word_list["ahs"]
  end

  def test_it_can_create_an_anagram_of_a_group_of_letters
    result = ["ah", "as", "hs", "ahs"]

    assert_equal result, wc.anagramify("ahs")
    assert_equal wc.anagramify("aabbccc").uniq, wc.anagramify("aabbccc")
  end

  def test_it_finds_legit_words_from_a_list_of_letters
    result = ["ah", "ha", "as", "sh", "ahs", "ash", "has", "sha"]
    word_list = wc.find_words("ahs")

    assert_equal result, word_list
    refute word_list.include?("sah")
  end

  def test_it_creates_a_list_of_words_with_an_inclusion_and_specific_spacing
    result = ["as", "sh", "ash"]
    word_list = wc.find_words_including("ah", "s", 1, 1)

    assert_equal result, word_list
    refute word_list.include?("sha")
    refute word_list.include?("ahs")
    refute word_list.include?("ah")
    refute word_list.include?("ha")
    refute word_list.include?("has")
  end

  def test_it_can_calculate_the_score_of_each_word
    result = { "as"=>2, "sh"=>5, "ash"=>6 }

    assert_equal result, wc.return_scores(["as", "sh", "ash"])
  end

  def test_it_can_return_results_with_a_wild_card
    single_result = ["as", "es", "sh", "ash", "is", "si", "ask", "os", "so", "asp", "ass", "us"]
    single_word_list = wc.find_words_including("a?", "s", 1, 1)
    double_result = ["as", "es", "sh", "ash", "is", "si", "ask", "os", "so", "asp", "ass", "us", "ose", "ess", "use", "ism", "psi", "tsk"]
    double_word_list = wc.find_words_including("a??", "s", 1, 1)

    assert_equal single_result, single_word_list
    assert_equal double_result, double_word_list
  end

  def test_cannot_include_more_than_10_tiles
    assert_raises RuntimeError do
      wc.find_words_including("adhoaestnariesn", "s", 1, 1)
    end
  end

  def test_cannot_include_more_than_1_inclusion
    assert_raises RuntimeError do
      wc.find_words_including("a", "sb", 1, 1)
    end
  end
end
