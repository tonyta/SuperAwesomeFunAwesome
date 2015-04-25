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
    puts printer.print(maze.maze)
  end
end

SuperAwesomeFun.new(rows: ARGV[0].to_i || 30, cols: ARGV[1].to_i || 40).awesome!
