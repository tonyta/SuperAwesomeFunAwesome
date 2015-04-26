module TopRowGenerator
  def top_row_must_be_east(maze)
    maze[0] = Array.new(maze[0].length) { :east }
  end
end

module LastColumnGenerator
  def last_column_must_be_north(maze)
    maze.each do |row|
      row[-1] = :north
    end
  end
end

module TopRightCornerGenerator
  def top_right_corner_must_be_nil(maze)
    maze[0][-1] = nil
  end
end

module MazePopulator
  def populate_maze(maze)
    maze.map! { |row| row.map! { |cell| cell = [:north, :east].sample } }
  end
end

module MazeRuleEnforcer
  include TopRowGenerator
  include LastColumnGenerator
  include TopRightCornerGenerator

  def enforce_rules_for(maze)
    last_column_must_be_north(maze)
    top_row_must_be_east(maze)
    top_right_corner_must_be_nil(maze)
  end
end

class BinaryMazeBuilder
  include MazePopulator
  include MazeRuleEnforcer

  def initialize(num_rows, num_cols)
    @maze = Array.new(num_rows) { Array.new(num_cols) }
  end

  def build_maze
    populate_maze(@maze)
    enforce_rules_for(@maze)
    @maze
  end
end
