# Helps count cubes
class CubeCounter
  COLORS = { red: 12, green: 13, blue: 14 }.freeze
  def initialize(input)
    @input = input
  end

  # a game is valid if no turn contains more cubes of a color than
  # the max amount of cubes defined in COLORS
  def analyze_valid_games
    @input.sum { |game| valid_game?(game) ? extract_game_id(game) : 0 }
  end

  # the power of a game is the product of the minimum number of cubes
  # of each color necessary to play all turns in the game.
  # the power analysis asks for the sum of the power of each game.
  def analyze_power
    @input.sum { |game| game_power(game) }
  end

  private

  # Extracts the game ID from the string
  def extract_game_id(game)
    game[/Game (\d+)/, 1].to_i
  end

  # checks if the game is valid based on color maximums
  def valid_game?(game)
    game.split(';').all? { |turn| turn_valid?(turn) }
  end

  def turn_valid?(turn)
    COLORS.all? { |color, max| count_color(turn, color) <= max }
  end

  def game_power(game)
    COLORS.keys.map { |color| max_color_count(game, color) }
          .reject(&:zero?)
          .reduce(1, :*)
  end

  # gets the largest occurrence of a color in a game
  def max_color_count(game, color)
    game.split(';').map { |turn| count_color(turn, color) }.max || 0
  end

  # gets the occurrences of a color in a given game string
  def count_color(turn, color)
    turn.scan(/(\d+) #{color}/).map { |match| match[0].to_i }.sum
  end
end
