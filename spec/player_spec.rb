# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  subject(:p1) { described_class.new }
  describe '#ask_name' do
    it 'assigns user input to name variable' do
      allow(p1).to receive(:gets).and_return('Bob')

      p1.ask_name
      expect(p1.name).to eql('Bob')
    end
  end
end
