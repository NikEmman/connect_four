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
    it 'returns the number if between 1-7' do
      allow(p1_input).to receive(:gets).and_return('2')
      expect(p1_input.input).to eq(2)
    end

    it ' returns error once when it gets wrong input once' do
      allow(p1_input).to receive(:gets).and_return('9', '2')
      error = double('speech')
      allow(error).to receive(:wrong_input).and_return('Error')
      expect(p1_input).to receive(error).once
      # not working
    end
  end
end
