require_relative 'maze'
require_relative 'maze_printer'

class SuperAwesomeFun
  def initialize(rows:, cols:, printer: MazePrinter, maze_builder: BinaryMazeBuilder)
    @maze = maze_builder.new(rows, cols).build_maze
    @printer = printer.new
  end

  def awesome!
    @printer.print(@maze)
  end
end

SuperAwesomeFun.new(rows: ARGV[0].to_i || 30, cols: ARGV[1].to_i || 40).awesome!
