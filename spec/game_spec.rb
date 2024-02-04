# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  subject(:game) { described_class.new }
  describe '#create_p1' do
    it 'assigns new player to @p1' do
      player1 = instance_double('Player')
      allow(Player).to receive(:new).and_return(player1)
      allow(player1).to receive(:ask_name)

      game.create_p1

      expect(game.p1).to eq(player1)
    end
  end
end
