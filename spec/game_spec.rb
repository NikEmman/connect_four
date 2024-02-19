# rubocop:disable Metrics/BlockLength
# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  describe '#create_p1' do
    subject(:game) { described_class.new }

    it 'assigns new player to @p1' do
      player1 = instance_double('Player')
      allow(Player).to receive(:new).and_return(player1)
      allow(player1).to receive(:ask_name)

      game.create_p1

      expect(game.p1).to eq(player1)
    end
  end

  describe '#current_player' do
    subject(:game_current) { described_class.new }

    context 'when round is odd' do
      it 'returns p1 as the current player' do
        game_current.instance_variable_set(:@round, 1)
        game_current.instance_variable_set(:@p1, 'Mary')
        game_current.instance_variable_set(:@p2, 'Tom')

        expect(game_current.current_player).to eq('Mary')
      end
    end

    context 'when round is even' do
      it 'returns p1 as the current player' do
        game_current.instance_variable_set(:@round, 2)
        game_current.instance_variable_set(:@p1, 'Mary')
        game_current.instance_variable_set(:@p2, 'Tom')

        expect(game_current.current_player).to eq('Tom')
      end
    end
  end

  describe '#vertical_win?' do
    context 'When a 4-piece streak has been made' do
      let(:game_vertical) { described_class.new }
      let(:board) do
        instance_double('Board', board: [
                          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
                          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
                          '  ', '  ', '  ', 'A', '  ', '  ', '  ',
                          '  ', '  ', '  ', 'A', '  ', '  ', '  ',
                          '  ', '  ', '  ', 'A', '  ', '  ', '  ',
                          '  ', '  ', '  ', 'A', '  ', '  ', '  '
                        ])
      end
      before do
        game_vertical.instance_variable_set(:@board, board)
      end

      it 'returns true for vertical streak' do
        token = 'A'
        expect(game_vertical.vertical_win?(token)).to be_truthy
      end
    end

    context 'When a 4-piece streak has not been made' do
      let(:game_vertical) { described_class.new }
      let(:board) do
        instance_double('Board', board: [
                          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
                          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
                          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
                          '  ', '  ', '  ', 'A', '  ', '  ', '  ',
                          '  ', '  ', '  ', 'A', '  ', '  ', '  ',
                          '  ', '  ', '  ', 'A', '  ', '  ', '  '
                        ])
      end
      before do
        game_vertical.instance_variable_set(:@board, board)
      end

      it 'returns true for vertical streak' do
        token = 'A'
        expect(game_vertical.vertical_win?(token)).to be_falsey
      end
    end
  end

  describe '#horizontal_win?' do
    context 'When a 4-piece streak has been made' do
      let(:game_horizontal) { described_class.new }
      let(:board) do
        instance_double('Board', board: [
                          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
                          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
                          '  ', '  ', 'A', 'A', 'A', 'A', '  ',
                          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
                          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
                          '  ', '  ', '  ', '  ', '  ', '  ', '  '
                        ])
      end
      before do
        game_horizontal.instance_variable_set(:@board, board)
      end

      it 'returns true for horizontal streak' do
        token = 'A'
        expect(game_horizontal.horizontal_win?(token)).to be_truthy
      end
    end

    context 'When a 4-piece streak has not been made' do
      let(:game_horizontal) { described_class.new }
      let(:board) do
        instance_double('Board', board: [
                          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
                          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
                          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
                          '  ', '  ', 'A', 'A', 'A', '  ', '  ',
                          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
                          '  ', '  ', '  ', '  ', '  ', '  ', '  '
                        ])
      end
      before do
        game_horizontal.instance_variable_set(:@board, board)
      end

      it 'returns true for horizontal streak' do
        token = 'A'
        expect(game_horizontal.horizontal_win?(token)).to be_falsey
      end
    end
  end

  describe '#diagonal_win?' do
    context 'When a 4-piece streak has been made' do
      let(:game_diagonal) { described_class.new }
      let(:board) do
        instance_double('Board', board: [
                          'A', '  ', '  ', '  ', '  ', '  ', '  ',
                          '  ', 'A', '  ', '  ', '  ', '  ', '  ',
                          '  ', '  ', 'A', '  ', '  ', '  ', '  ',
                          '  ', '  ', '  ', 'A', '  ', '  ', '  ',
                          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
                          '  ', '  ', '  ', '  ', '  ', '  ', '  '
                        ])
      end
      before do
        game_diagonal.instance_variable_set(:@board, board)
      end

      it 'returns true for diagonal streak' do
        token = 'A'
        expect(game_diagonal.diagonal_win?(token)).to be_truthy
      end
    end

    context 'When a 4-piece streak has not been made' do
      let(:game_diagonal) { described_class.new }
      let(:board) do
        instance_double('Board', board: [
                          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
                          '  ', 'A', '  ', '  ', '  ', '  ', '  ',
                          '  ', '  ', 'A', '  ', '  ', '  ', '  ',
                          '  ', '  ', '  ', 'A', '  ', '  ', '  ',
                          '  ', '  ', '  ', '  ', '  ', '  ', '  ',
                          '  ', '  ', '  ', '  ', '  ', '  ', '  '
                        ])
      end
      before do
        game_diagonal.instance_variable_set(:@board, board)
      end

      it 'returns true for diagonal streak' do
        token = 'A'
        expect(game_diagonal.diagonal_win?(token)).to be_falsey
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
