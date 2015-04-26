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

module OutputBuilder
  def build_output(maze)
    maze.map.with_index do |row, row_num|
      row.map.with_index do |cell, col_num|
        current = cell
        below = maze[row_num+1] && maze[row_num+1][col_num]   || :east
        diag =  maze[row_num+1] && maze[row_num+1][col_num+1] || :east

        row = if current == :east && diag == :east && below == :east
          '──'
        elsif current == :east && diag == :east && below == :north
          ' ┌'
        elsif current == :east && diag == :north && below == :east
          '─╴'
        elsif current == :east && diag == :north && below == :north
          ' ╷'
        elsif current == :north && diag == :east && below == :east
          '─┴'
        elsif current == :north && diag == :east && below == :north
          ' ├'
        elsif current == :north && diag == :north && below == :east
          '─┘'
        elsif current == :north && diag == :north && below == :north
          ' │'
        else
          ' │'
        end
      end.join
    end
  end
end

class BoxMazePrinter
  include OutputBuilder
  include OutputPolisher

  def print(maze)
    output = build_output(maze)
    polish_output(output, maze)
    puts output
  end
end
