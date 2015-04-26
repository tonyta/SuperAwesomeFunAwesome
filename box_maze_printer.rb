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

class SquareBuilder
  def initialize(maze, row, col_num)
    @current = maze[row][col_num]
    @below   = maze[row+1] && maze[row+1][col_num]   || :east
    @diag    = maze[row+1] && maze[row+1][col_num+1] || :east
  end

  def build_square
    if @current == :east && @diag == :east && @below == :east
      '──'
    elsif @current == :east && @diag == :east && @below == :north
      ' ┌'
    elsif @current == :east && @diag == :north && @below == :east
      '─╴'
    elsif @current == :east && @diag == :north && @below == :north
      ' ╷'
    elsif @current == :north && @diag == :east && @below == :east
      '─┴'
    elsif @current == :north && @diag == :east && @below == :north
      ' ├'
    elsif @current == :north && @diag == :north && @below == :east
      '─┘'
    elsif @current == :north && @diag == :north && @below == :north
      ' │'
    else
      ' │'
    end
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
