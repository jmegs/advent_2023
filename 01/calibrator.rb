# frozen_string_literal: true

class Calibrator
  NUMBERS = %w[one two three four five six seven eight nine].freeze

  def initialize(input)
    @input = input
  end

  def calibrate(use_words: false)
    regexp = use_words ? '\d|one|two|three|four|five|six|seven|eight|nine' : '\d'

    values = @input.map do |line|
      first = line[/#{regexp}/]

      # this thing uses something called 'greedy' matches to capture the last match
      # 1. `.*` matches as much of the string as it can.
      # 2. The engine then tries to match #{regexp} (which is your digit or spelled-out digit), but since .* has already
      #    consumed the entire string, it must backtrack.
      # 3. The engine backtracks just enough for #{regexp} to match the last occurrence of the pattern in the string.
      # 4. Since 1 is used after the pattern, it tells the regex to return only the part of the string captured by the
      #    first set of parentheses ((#{regexp})), which is the last occurrence of the pattern.
      last = line[/.*(#{regexp})/, 1]
      string_to_number(first) * 10 + string_to_number(last)
    end

    values.sum
  end

  private

  def string_to_number(str)
    index = NUMBERS.find_index(str)
    # if it doesn't match somthing in the numbers array,
    # it must be a digit as a string
    index ? index + 1 : str.to_i
  end
end
