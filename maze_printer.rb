
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
    " ¯" * maze.last.length
  end
end

class MazePrinter
  include RowGenerator
  include BottomGenerator

  def print(maze)
    output = ""
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
