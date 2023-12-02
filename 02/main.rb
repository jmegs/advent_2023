require_relative '../helpers'
require_relative 'cube_counter'

input = Helpers.read_file_lines 'input.txt'

counter = CubeCounter.new input

puts "Part 1: #{counter.analyze_valid_games}"
