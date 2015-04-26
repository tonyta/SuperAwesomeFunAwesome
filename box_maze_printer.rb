module LinePolisher
  def polish_line(line, maze)
    line.insert(0, line[0] == '─' ? '├' : '│')
    line[-1] = '│'
  end
end

module TopAndCornerPolisher
  def polish_top_and_corners(output, maze)
    output.last[0] = '└'
    output.last[-1] = '┘'
    output.unshift('┌' + ('─'*(output.first.length-2)) + '┐')
  end
end

module OutputPolisher
  include LinePolisher
  include TopAndCornerPolisher

  def polish_output(output, maze)
    output.each { |line| polish_line(line, maze) }
    polish_top_and_corners(output, maze)
  end
end

module TopRightCornerSquareBuilder
  def build_for_top_right_corner(below)
    below == :north ? ' │' : '─┘'
  end
end

module BelowIsNorthSquareBuilder
  # this breaks the 3-line rule
  def build_for_below_is_north(current, diagonal)
    return ' ┌' if @current == :east  && @diagonal == :east
    return ' ╷' if @current == :east  && @diagonal == :north
    return ' ├' if @current == :north && @diagonal == :east
    return ' │' if @current == :north && @diagonal == :north
  end
end

module BelowIsEastSquareBuilder
  # this breaks the 3-line rule
  def build_for_below_is_east(current, diagonal)
    return '──' if @current == :east  && @diagonal == :east
    return '─╴' if @current == :east  && @diagonal == :north
    return '─┴' if @current == :north && @diagonal == :east
    return '─┘' if @current == :north && @diagonal == :north
  end
end

class SquareBuilder
  # builds bottom and bottom right corner of the square of a given cell
  # while monitoring those that affect it (cell below and cell diagonal from)

  include TopRightCornerSquareBuilder
  include BelowIsNorthSquareBuilder
  include BelowIsEastSquareBuilder

  def initialize(maze, row, col_num)
    @current     = maze[row][col_num]
    @below       = maze[row+1] && maze[row+1][col_num]   || :east
    @diagonal    = maze[row+1] && maze[row+1][col_num+1] || :east
  end

  def build_square
    return build_for_top_right_corner(@below) if @current.nil?
    return build_for_below_is_north(@current, @diagonal) if @below == :north
    return build_for_below_is_east(@current, @diagonal)  if @below == :east
  end
end

class LineBuilder
  def initialize(maze)
    @maze = maze
  end

  def build_line(row_num)
    @maze[row_num].map.with_index do |_, col_num|
      SquareBuilder.new(@maze, row_num, col_num).build_square
    end.join
  end
end

class OutputBuilder
  def initialize(maze)
    @maze = maze
    @line_builder = LineBuilder.new(maze)
  end

  def build_output
    @maze.map.with_index { |_, row_num| @line_builder.build_line(row_num) }
  end
end

class BoxMazePrinter
  include OutputPolisher

  def initialize(maze)
    @maze = maze
    @builder = OutputBuilder.new(maze)
  end

  def print
    output = @builder.build_output
    polish_output(output, @maze)
    puts output
  end
end
