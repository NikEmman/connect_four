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
    let(:speech) { double('Speech') }

    it 'accepts input in the range of 1-7' do
      allow(p1_input).to receive(:gets).and_return('2')
      expect(p1_input.input).to eq(2)
    end

    it 'prompts for input again if number is out of range' do
      allow(p1_input).to receive(:gets).and_return('9', '0', '2')
      expect(p1_input.input).to eq(2)
    end

    it 'receives the error msg once per wrong input' do
      allow(p1_input).to receive(:gets).and_return('9', '0', '2')
      expect(speech).to receive(:wrong_input).twice
      p1_input.input
      # still not working
    end
  end
end
