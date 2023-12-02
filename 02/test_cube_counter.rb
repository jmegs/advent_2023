require 'minitest/autorun'
require_relative '../helpers'
require_relative 'cube_counter'

TEST_INPUT = Helpers.read_file_lines 'test_input.txt'

class CubeCounterTest < Minitest::Test
  def test_part_one
    assert_equal 8, CubeCounter.new(TEST_INPUT).analyze_valid_games
  end

  def test_part_two
    assert_equal 2286, CubeCounter.new(TEST_INPUT).analyze_power
  end
end
