# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require_relative 'speech'
class Game
  attr_accessor :p1, :p2

  def initialize
    @p1 = nil
    @p2 = nil
    @round = 1
    @board = Board.new
  end

  def create_p1
    Speech.new.create_p1
    @p1 = Player.new(nil, "\u{1F7E1}")
    @p1.ask_name
  end

  def create_p2
    Speech.new.create_p2
    @p2 = Player.new(nil, "\u{1F534}")
    @p2.ask_name
  end

  def current_player
    @round.odd? ? @p1 : @p2
  end

  def play
    Speech.new.welcome
    # help
    create_p1
    create_p2
    loop do
      # here is basic game loop
      Speech.new.ask_input(current_player.name)
      column = current_player.input
      token = current_player.token
      @board.update(column, token)
      @board.display
      # check for win/end
      # @round +=1
    end
  end
end
