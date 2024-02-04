# frozen_string_literal: true

require_relative 'player'
class Game
  attr_accessor :p1

  def initialize
    @p1 = nil
    @p2 = nil
    @round = 0
  end

  def create_p1
    puts 'What is Player 1 name?'
    @p1 = Player.new
    @p1.ask_name
  end

  def create_p2
    puts 'What is Player 2 name?'
    @p2 = Player.new
    @p2.ask_name
  end
end
