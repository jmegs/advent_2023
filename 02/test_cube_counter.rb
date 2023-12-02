require 'minitest/autorun'
require_relative '../helpers'
require_relative 'cube_counter'

SAMPLE_ONE = Helpers.read_file_lines 'part_one_test_input.txt'

class CubeCounterTest < Minitest::Test
  def test_part_one
    assert_equal 8, CubeCounter.new(SAMPLE_ONE).analyze_valid_games
  end
end
