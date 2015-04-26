module SquareGenerator
  def generate_square(cell)
    return "¯ " if cell == :east
    return " |" if cell == :north
    "¯|"
  end
end

module RowGenerator
  include SquareGenerator

  def generate_line(row)
    output = "|"
    row.each { |cell| output << generate_square(cell) }
    output << "\n"
  end
end

module BottomGenerator
  def print_bottom(maze)
    output = " "
    output << "¯ " * maze.last.length
    output << "\n"
  end
end

class MazePrinter
  include RowGenerator
  include BottomGenerator

  def print(maze)
    output = ''
    maze.each { |row| output << generate_line(row) }
    puts output << print_bottom(maze)
  end
end

RSpec.describe SquareGenerator, '#generate_square' do
  subject { Object.new.extend(described_class) }

  context 'when cell is :east' do
    specify { expect(subject.generate_square(:east)).to eq "¯ " }
  end

  context 'when cell is :north' do
    specify { expect(subject.generate_square(:north)).to eq " |" }
  end

  context 'when cell is nil' do
    specify { expect(subject.generate_square(nil)).to eq "¯|" }
  end
end

RSpec.describe RowGenerator, '#generate_line' do
  subject { Object.new.extend(described_class) }
  let(:row) { [:east, :north, nil] }

  it 'should generate a line from a given array' do
    expect(subject.generate_line(row)).to eq("|¯  |¯|\n")
  end
end

RSpec.describe MazePrinter, '#print' do
  let(:maze) { [[:east, :east, nil],[:east, :north, :north]]}
  let(:subject) { MazePrinter.new.print(maze) }

  it 'should print a maze' do
    expect{ subject }.to output("|¯ ¯ ¯|\n|¯  | |\n ¯ ¯ ¯ \n").to_stdout
  end
end

RSpec.describe BottomGenerator, '#print_bottom' do
  let(:maze) { [ Array.new(3) ] }
  let(:subject) { Object.new.extend(described_class) }

  it "prints the bottom row" do
    expect(subject.print_bottom(maze)).to eq(" ¯ ¯ ¯ \n")
  end
end
