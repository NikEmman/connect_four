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

  describe '#valid?' do
    subject(:board_valid) { described_class.new }

    it 'returns true if column has available spots' do
      expect(board_valid.valid?(2)).to be_truthy
    end
  end

  describe 'column_not_full?' do
    subject(:board_column) { described_class.new }
    it 'returns true if column  has all empty spots' do
      expect(board_column.column_not_full?(2)).to be_truthy
    end

    it 'returns true if column  has  empty spots' do
      board_column.update(2, 'A')

      expect(board_column.column_not_full?(2)).to be_truthy
    end

    it 'returns false if column is full' do
      board_column.update(2, 'A')
      board_column.update(2, 'A')
      board_column.update(2, 'A')
      board_column.update(2, 'A')
      board_column.update(2, 'A')
      board_column.update(2, 'A')

      expect(board_column.column_not_full?(2)).to be_falsey
    end
  end
end
# rubocop:enable Metrics/BlockLength
