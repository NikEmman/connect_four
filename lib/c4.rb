# frozen_string_literal: true

require_relative 'player'
class C4
  attr_reader :p1

  def initialize
    @p1 = nil
    @p2 = nil
    @round = 0
  end

  def create_p1
    puts 'What is Player 1 name?'
    @p1 = Player.new(gets.chomp, "\u{1F534}")
  end

  def create_p2
    puts 'What is Player 2 name?'
    @p2 = Player.new(gets.chomp, "\u{1F7E1}")
  end
end
