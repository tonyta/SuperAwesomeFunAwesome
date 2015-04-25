class MazePrinter
  def print(maze)
    output = ""
    maze.each { |row| output << print_row(row) }
    output << print_bottom(maze)
    puts output
  end

  def print_row(row)
    output = "|"
    row.map do |cell|
      output << "¯ " if cell == :east
      output << " |" if cell == :north
      output << "¯|" if cell == nil
    end
    output << "\n"
  end

  def print_bottom(maze)
    " ¯" * maze.last.length
  end
end
