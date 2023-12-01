gem "minitest"
require "minitest/autorun"
require_relative 'calibrator'

SAMPLE_ONE = %w[1abc2 pqr3stu8vwx a1b2c3d4e5f treb7uchet]
SAMPLE_TWO = %w[two1nine eightwothree abcone2threexyz xtwone3four 4nineeightseven2 zoneight234 7pqrstsixteen]

class CalibratorTest < Minitest::Test
  def test_calibrates_example
    assert_equal 142, Calibrator.new(SAMPLE_ONE).calibrate
  end

  def test_calibrates_example_with_letters
    assert_equal 281, Calibrator.new(SAMPLE_TWO).calibrate_with_letters
  end
end
