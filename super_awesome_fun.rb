require_relative 'maze'
require_relative 'maze_printer'
require_relative 'box_maze_printer'
require 'optparse'

class SuperAwesomeFun
  def initialize(rows:, cols:, printer: MazePrinter, maze_builder: BinaryMazeBuilder)
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
    args[:rows], args[:cols] = dimensions.split(',').map(&:to_i)
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
