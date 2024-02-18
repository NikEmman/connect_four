# rubocop:disable Metrics/BlockLength
# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  describe '#ask_name' do
    subject(:p1) { described_class.new }

    it 'assigns user input to name variable' do
      allow(p1).to receive(:gets).and_return('Bob')

      p1.ask_name
      expect(p1.name).to eql('Bob')
    end
  end

  describe '#input' do
    subject(:p1_input) { described_class.new }

    board = [
      '  ', '  ', '  ', '  ', '  ', '  ', '  ',
      '  ', '  ', '  ', '  ', '  ', '  ', '  ',
      '  ', '  ', '  ', '  ', '  ', '  ', '  ',
      '  ', '  ', '  ', '  ', '  ', '  ', '  ',
      '  ', '  ', '  ', '  ', '  ', '  ', '  ',
      '  ', '  ', '  ', '  ', '  ', '  ', '  '
    ]

    it 'accepts input in the range of 1-7' do
      allow(p1_input).to receive(:gets).and_return('2')
      expect(p1_input.input(board)).to eq(2)
    end

    it 'prompts for input again if number is invalid' do
      allow(p1_input).to receive(:gets).and_return('9', '0', '2')
      expect(p1_input.input(board)).to eq(2)
    end
  end

  describe '#column_not_full?' do
    subject(:player) { described_class.new }
    context 'When column has available spots' do
      it 'returns true when column is empty' do
        board = [
          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
          '  ', '  ', '  ', '  ', '  ', '  ', '  '
        ]
        column = 2
        expect(player.column_not_full?(board, column)).to be_truthy
      end

      it 'returns true when column is empty' do
        board = [
          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
          '  ', 'A', '  ', '  ', '  ', '  ', '  ',
          '  ', 'A', '  ', '  ', '  ', '  ', '  ',
          '  ', 'A', '  ', '  ', '  ', '  ', '  ',
          '  ', 'A', '  ', '  ', '  ', '  ', '  ',
          '  ', 'A', '  ', '  ', '  ', '  ', '  '
        ]
        column = 2
        expect(player.column_not_full?(board, column)).to be_truthy
      end
    end
    context 'When chosen column is full' do
      it 'returns false when column is empty' do
        board = [
          '  ', 'A', '  ', '  ', '  ', '  ', '  ',
          '  ', 'A', '  ', '  ', '  ', '  ', '  ',
          '  ', 'A', '  ', '  ', '  ', '  ', '  ',
          '  ', 'A', '  ', '  ', '  ', '  ', '  ',
          '  ', 'A', '  ', '  ', '  ', '  ', '  ',
          '  ', 'A', '  ', '  ', '  ', '  ', '  '
        ]
        column = 2
        expect(player.column_not_full?(board, column)).to be_falsey
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
