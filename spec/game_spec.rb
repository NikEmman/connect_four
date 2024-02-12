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
end
# rubocop:enable Metrics/BlockLength
