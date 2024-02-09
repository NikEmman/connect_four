# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require_relative 'speech'
class Game
  attr_accessor :p1, :p2

  def initialize
    @p1 = nil
    @p2 = nil
    @round = 0
  end

  def create_p1
    Speech.new.create_p1
    @p1 = Player.new
    @p1.ask_name
  end

  def create_p2
    Speech.new.create_p2
    @p2 = Player.new
    @p2.ask_name
  end
end
