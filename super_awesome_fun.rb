require_relative 'maze'
require_relative 'maze_printer'

class SuperAwesomeFun
  def initialize(rows:, cols:)
    @rows = rows
    @cols = cols
  end

  def awesome!
    printer = MazePrinter.new
    maze = Maze.new(@rows, @cols)
    printer.print(maze.maze)
  end
end

SuperAwesomeFun.new(rows: 30, cols: 40).awesome!
