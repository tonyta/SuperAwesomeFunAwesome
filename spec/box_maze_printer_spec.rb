require './box_maze_printer'

RSpec.describe BoxMazePrinter, '#print' do
  let(:maze) { [[:east, :east, nil], [:east, :north, :north]]}
  let(:subject) { described_class.new(maze).print }

  it 'should print a maze' do
    expect{ subject }.to output("┌─────┐\n├─╴ ╷ │\n└───┴─┘\n").to_stdout
  end

  context 'when a maze is 1x1' do
    let(:maze) { [[nil]] }
    it 'correctly prints it' do
      expect{ subject }.to output("┌─┐\n└─┘\n").to_stdout
    end
  end
end
