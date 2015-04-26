module SquareGenerator
  def generate_square(cell)
    return "¯ " if cell == :east
    return " |" if cell == :north
    "¯|"
  end
end

module RowGenerator
  include SquareGenerator

  def generate_line(row)
    output = "|"
    row.each { |cell| output << generate_square(cell) }
    output << "\n"
  end
end

module BottomGenerator
  def print_bottom(maze)
    output = " "
    output << "¯ " * maze.last.length
    output << "\n"
  end
end

class SimpleMazePrinter
  include RowGenerator
  include BottomGenerator

  def initialize(maze)
    @maze = maze
  end

  def print
    output = ''
    @maze.each { |row| output << generate_line(row) }
    puts output << print_bottom(@maze)
  end
end
