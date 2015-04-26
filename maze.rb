require 'rspec'

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

RSpec.describe BinaryMazeBuilder, '#build_maze' do
  let(:num_rows) { 3 }
  let(:num_cols) { 4 }
  subject { described_class.new(num_rows, num_cols).build_maze }

  it 'should be an Array' do
    expect(subject).to be_an Array
  end

  it 'should contain all Arrays' do
    expect(subject).to all( be_an Array )
  end

  it 'should have the right number of rows' do
    expect(subject.length).to eq(num_rows)
  end

  it 'should have the right number of columns' do
    expect(subject.map(&:length)).to all( eq(num_cols) )
  end

  it 'should have the top row except for the last column as :east' do
    expect(subject[0][0..-2]).to all( be :east )
  end

  it 'should have the last column except for the first row as :north' do
    expect(subject.map(&:last)[1..-1]).to all( be :north )
  end

  it 'should have the top right cell as nil' do
    expect(subject.first.last).to be_nil
  end

  it 'should have all cells be :north or :east except for the top right corner' do
    subject.first.pop # removes top right corner
    expect(subject.flatten).to all( be(:north).or be(:east) )
  end
end

RSpec.describe MazePopulator, '#populate_maze' do
  let(:array) { Array.new(4) { Array.new(3) } }
  subject { Object.new.extend(described_class) }

  it 'should populate a 2D array with :north or :east' do
    expect(subject.populate_maze(array).flatten).to all( be(:east).or be(:north) )
  end
end

RSpec.describe TopRowGenerator, '#top_row_must_be_east' do
  let(:array) { Array.new(4) { Array.new(3) } }
  subject { Object.new.extend(described_class) }
  it 'should return a valid top row' do
    subject.top_row_must_be_east(array)
    expect(array.first).to all( be(:east) )
  end
end
