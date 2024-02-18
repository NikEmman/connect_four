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
end
