# frozen_string_literal: true

require_relative '../lib/c4'

describe C4 do
  subject(:game) { described_class.new }
  describe 'create_p1' do
    name = 'Bob'
    let(:player) { Player.new(name, "\u{1F534}") }

    it 'assigns new player to @p1' do
      allow(game).instance_variable_get(:@p1)
      game.create_p1
      expect(game.p1.name).to eq('Bob')
    end
  end
end
