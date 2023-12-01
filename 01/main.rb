require_relative 'calibrator'
require_relative '../helpers'

input = Helpers.read_file_lines 'input.txt'

calibrator = Calibrator.new input

puts "Part 1: #{calibrator.calibrate}"
puts "Part 2: #{calibrator.calibrate(use_words: true)}"

# we learned about greedy capture
# https://regex101.com/r/UNyBHB/1

# last = line[/.*(\d|one|two|three|four|five|six|seven|eight|nine)/, 1]
# .* matches as much of the string as it can.
# The engine then tries to match /\d|one|two|three|four|five|six|seven|eight|nine/ (which is your digit or spelled-out digit), but since .* has already consumed the entire string, it must backtrack.
# The engine backtracks just enough to match the last occurrence of the pattern in the string.
# Since 1 is used after the pattern, it tells the regex to return only the part of the string captured by the first set of parentheses (\d|one|two|three|four|five|six|seven|eight|nine), which is the last occurrence of the pattern.
