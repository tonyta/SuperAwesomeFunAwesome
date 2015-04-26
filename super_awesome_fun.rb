require_relative 'binary_maze'
require_relative 'simple_maze_printer'
require_relative 'box_maze_printer'
require 'optparse'

class SuperAwesomeFun
  def initialize(rows:, cols:, printer: SimpleMazePrinter, maze_builder: BinaryMazeBuilder)
    @maze = maze_builder.new(rows, cols).build_maze
    @printer = printer.new(@maze)
  end

  def awesome!
    @printer.print
  end
end

args = { rows: 30, cols: 40 }

OptionParser.new do |opts|
  opts.banner = "Usage: ruby super_awesome_fun.rb [options]"

  opts.on("-d", "--dimensions=ROWS,COLUMNS", "Dimensions of the maze (default: #{args[:rows]}, #{args[:cols]})") do |dimensions|
    rows, cols = dimensions.insert(-1, ', ').split(',').map(&:to_i)
    args[:rows] = rows if rows > 0
    args[:cols] = cols if cols > 0
  end

  opts.on("-b", "--box-printer", "Print using ASCII box-drawing") do
    args[:printer] = BoxMazePrinter
  end

  opts.on("-h", "--help", "Prints this help") do
    puts opts
    exit
  end
end.parse!

SuperAwesomeFun.new(**args).awesome!
