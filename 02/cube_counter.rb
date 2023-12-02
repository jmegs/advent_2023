# Helps count cubes
class CubeCounter
  COLORS = { red: 12, green: 13, blue: 14 }.freeze
  def initialize(input)
    @input = input
  end

  def analyze_valid_games
    @input.sum { |game| valid_game?(game) ? game_id(game) : 0 }
  end

  def analyze_powers; end

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
        sum_color(color, turn) <= max
      end
    end
  end

  # gets the sum of occurrences of a color
  def sum_color(color, game)
    game.scan(/(\d+) #{color}/).flatten.map(&:to_i).sum
  end
end
