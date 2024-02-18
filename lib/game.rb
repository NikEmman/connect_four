# rubocop:disable Metrics/AbcSize
# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require_relative 'speech'
require 'io/console'
class Game
  attr_accessor :p1, :p2

  def initialize
    @p1 = nil
    @p2 = nil
    @round = 1
    @board = Board.new
  end

  def create_p1
    Speech.create_p1
    @p1 = Player.new(nil, "\u{1F7E1}")
    @p1.ask_name
  end

  def create_p2
    Speech.create_p2
    @p2 = Player.new(nil, "\u{1F534}")
    @p2.ask_name
  end

  def current_player
    @round.odd? ? @p1 : @p2
  end

  # def latest_play(original_board, current_board)
  # end

  def play # rubocop:disable Metrics/MethodLength
    Speech.welcome
    # help
    create_p1
    create_p2
    @board.display

    loop do
      # here is basic game loop
      Speech.ask_input(current_player.name)
      column = current_player.input(@board.board)
      token = current_player.token
      original_board = @board.board.dup
      @board.update(column, token)
      $stdout.clear_screen
      @board.display
      break if win(original_board, @board.board) || @board.full?

      @round += 1
    end
  end

  # def update(column, token)
  #   original_board = @board.dup
  #   for i in (0..5)
  #     next unless @board[(column + 7 * i) - 1] == '  '

  #     @board[(column + 7 * i) - 1] = token
  #     break

  #   end
  #   original_board.each_with_index.find do |value, index|
  #     value != @board[index]
  #   end
  # end
end
# rubocop:enable Metrics/AbcSize
