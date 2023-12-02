# Helps count cubes
class CubeCounter
  COLORS = { red: 12, green: 13, blue: 14 }.freeze
  def initialize(input)
    @input = input
  end

  # a game is valid if no turn contains more cubes of a color than
  # the max amount of cubes defined in COLORS
  def analyze_valid_games
    @input.sum { |game| valid_game?(game) ? game_id(game) : 0 }
  end

  # the power of a game is the product of the minimum number of cubes
  # of each color necessary to play all turns in the game.
  # the power analysis asks for the sum of the power of each game.
  def analyze_power
    @input.sum { |game| calculate_game_power(game) }
  end

  private

  # Extracts the game ID from the string
  def game_id(game)
    match = game.match(/Game (\d+)/)
    match ? match[1].to_i : 0
  end

  # checks if the game is valid based on color maximums
  def valid_game?(game)
    turns = game.split(';')
    turns.all? do |turn|
      COLORS.all? do |color, max|
        scan_for_color(color, turn).sum <= max
      end
    end
  end

  def calculate_game_power(game)
    max_occurrences_per_color = COLORS.keys.map do |color|
      max_occurrences_of_color(color, game)
    end

    nonzero_maxes = max_occurrences_per_color.reject(&:zero?)

    return 1 if nonzero_maxes.empty?

    # multiplies array together
    nonzero_maxes.inject(:*)
  end

  # gets the largest occurrence of a color in a game
  def max_occurrences_of_color(color, game)
    scan_for_color(color, game).max || 0
  end

  # gets the occurrences of a color in a given game string
  def scan_for_color(color, str)
    str.scan(/(\d+) #{color}/).flatten.map(&:to_i)
  end
end
