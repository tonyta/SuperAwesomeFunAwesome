require_relative 'maze'
require_relative 'maze_printer'
require 'optparse'

class SuperAwesomeFun
  def initialize(rows:, cols:, printer: MazePrinter, maze_builder: BinaryMazeBuilder)
    @maze = maze_builder.new(rows, cols).build_maze
    @printer = printer.new
  end

  def awesome!
    @printer.print(@maze)
  end
end

args = Struct.new(:rows, :cols).new(30, 40)

OptionParser.new do |opts|
  opts.banner = "Usage: ruby super_awesome_fun.rb [options]"

  opts.on("-d", "--dimensions=ROWS,COLUMNS", "Dimensions of the maze (default: #{args.rows}, #{args.cols})") do |dimensions|
    args.rows, args.cols = dimensions.split(',').map(&:to_i)
  end

  opts.on("-h", "--help", "Prints this help") do
    puts opts
    exit
  end
end.parse!

SuperAwesomeFun.new(rows: args.rows, cols: args.cols).awesome!
