class Calibrator
  REGEXP_DIGITS = /\d/
  REGEXP_LAST_DIGITS = /.*(\d).*/
  REGEXP_WITH_WORDS = /\d|one|two|three|four|five|six|seven|eight|nine/

  # this thing uses something called 'greedy' matches to capture the last match
  # 1. `.*` matches as much of the string as it can.
  # 2. The engine then tries to match #{regexp} (which is your digit or spelled-out digit), but since .* has already consumed the entire string, it must backtrack.
  # 3. The engine backtracks just enough for #{regexp} to match the last occurrence of the pattern in the string.
  # 4. Since 1 is used after the pattern, it tells the regex to return only the part of the string captured by the first set of parentheses ((#{regexp})), which is the last occurrence of the pattern.
  REGEXP_LAST_WITH_WORDS = /.*(\d|one|two|three|four|five|six|seven|eight|nine)/

  NUMBERS = %w[one two three four five six seven eight nine]

  def initialize(input)
    @input = input
  end

  def calibrate
    sum = 0

    @input.each do |line|
      first = line[REGEXP_DIGITS]
      last = line[REGEXP_LAST_DIGITS, 1]
      sum += string_to_number(first) * 10 + string_to_number(last)
    end

    return sum
  end

  def calibrate_with_letters
    sum = 0

    @input.each do |line|
      first = line[REGEXP_WITH_WORDS]
      last = line[REGEXP_LAST_WITH_WORDS, 1]
      sum += string_to_number(first) * 10 + string_to_number(last)
    end

    return sum
  end

  private
  def string_to_number(str)
    index = NUMBERS.find_index(str)
    # if it doesn't match somthing in the numbers array,
    # it must be a digit as a string
    index ? index + 1 : str.to_i
  end

end
