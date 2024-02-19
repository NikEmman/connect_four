# rubocop:disable Style/For
# rubocop:disable Metrics/AbcSize
# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require_relative 'speech'
require 'io/console'
class Game
  attr_accessor :p1, :p2, :board

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
      @board.update(column, token)
      $stdout.clear_screen
      @board.display
      break if win?(token) || @board.full?

      @round += 1
    end
    @board.full? ? Speech.full_board : Speech.congrats(current_player.name)
  end

  def win?(token)
    horizontal_win?(token) || vertical_win?(token) || diagonal_win?(token)
  end

  def horizontal_win?(token)
    for row in 0..5
      for col in 0..3
        return true if @board.board[row * 7 + col..row * 7 + col + 3].all? { |cell| cell == token }
      end
    end
    false
  end

  def vertical_win?(token)
    for col in 0..6
      for row in 0..2
        return true if @board.board[row * 7 + col] == token &&
                       @board.board[(row + 1) * 7 + col] == token &&
                       @board.board[(row + 2) * 7 + col] == token &&
                       @board.board[(row + 3) * 7 + col] == token
      end
    end
    false
  end

  def diagonal_win?(token)
    for row in 0..2
      for col in 0..3
        return true if @board.board[row * 7 + col] == token &&
                       @board.board[(row + 1) * 7 + col + 1] == token &&
                       @board.board[(row + 2) * 7 + col + 2] == token &&
                       @board.board[(row + 3) * 7 + col + 3] == token

        return true if @board.board[row * 7 + col + 3] == token &&
                       @board.board[(row + 1) * 7 + col + 2] == token &&
                       @board.board[(row + 2) * 7 + col + 1] == token &&
                       @board.board[(row + 3) * 7 + col] == token
      end
    end
    false
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Style/For
