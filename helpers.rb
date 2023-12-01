module Helpers
  def self.read_file_lines(file_path)
    unless File.exist?(file_path)
      puts "File not found: #{file_path}"
      return []
    end

    lines = File.readlines(file_path)

    lines.map(&:chomp)
  end
end
