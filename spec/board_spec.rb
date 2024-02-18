# rubocop:disable Metrics/BlockLength
# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  describe '#update' do
    subject(:board_update) { described_class.new }
    context 'When column is not full' do
      it 'updates the column at the lowest spot' do
        board_update.update(2, 'A')
        expect(board_update.board[1]).to eq('A')
      end

      it 'updates the next spot up when lowest is full' do
        board_update.update(2, 'A')
        board_update.update(2, 'A')
        expect(board_update.board[8]).to eq('A')
      end
    end
  end

  describe '#full?' do
    subject(:board_empty) { described_class.new }
    context 'When board is completely empty' do
      it 'returns false' do
        expect(board_empty.full?).to be_falsey
      end
    end

    context 'When board has some empty spaces' do
      let(:partially_filled_board) do
        described_class.new([
                              'X', 'O', 'X', 'X', 'X', 'X', 'X',
                              'O', 'O', 'O', 'O', 'O', 'O', '  ',
                              'X', 'X', 'X', 'X', 'X', 'X', '  ',
                              '  ', '  ', '  ', '  ', '  ', '  ', '  ',
                              '  ', '  ', '  ', '  ', '  ', '  ', '  ',
                              '  ', '  ', '  ', '  ', '  ', '  ', '  '
                            ])
      end
      it 'returns false' do
        expect(partially_filled_board.full?).to be_falsey
      end
    end

    context 'when the board is completely filled' do
      let(:full_board) do
        described_class.new(%w[
                              X O X X X X X
                              O O O O O O X
                              X X X X X X O
                              X X X X X X X
                              O O O O O O O
                              X X X X X X X
                            ])
      end

      it 'returns true' do
        expect(full_board.full?).to be_truthy
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
