# rubocop:disable Metrics/MethodLength
# rubocop:disable Style/For
# rubocop:disable Metrics/AbcSize
# frozen_string_literal: true

class Board
  attr_accessor :board

  def initialize(board = [
    '  ', '  ', '  ', '  ', '  ', '  ', '  ',
    '  ', '  ', '  ', '  ', '  ', '  ', '  ',
    '  ', '  ', '  ', '  ', '  ', '  ', '  ',
    '  ', '  ', '  ', '  ', '  ', '  ', '  ',
    '  ', '  ', '  ', '  ', '  ', '  ', '  ',
    '  ', '  ', '  ', '  ', '  ', '  ', '  '
  ])
    @board = board
  end

  def display
    puts "| #{board[35]} | #{board[36]} | #{board[37]} | #{board[38]} | #{board[39]} | #{board[40]} | #{board[41]} |"
    puts '|----+----+----+----+----+----+----|'
    puts "| #{board[28]} | #{board[29]} | #{board[30]} | #{board[31]} | #{board[32]} | #{board[33]} | #{board[34]} |"
    puts '|----+----+----+----+----+----+----|'
    puts "| #{board[21]} | #{board[22]} | #{board[23]} | #{board[24]} | #{board[25]} | #{board[26]} | #{board[27]} |"
    puts '|----+----+----+----+----+----+----|'
    puts "| #{board[14]} | #{board[15]} | #{board[16]} | #{board[17]} | #{board[18]} | #{board[19]} | #{board[20]} |"
    puts '|----+----+----+----+----+----+----|'
    puts "| #{board[7]} | #{board[8]} | #{board[9]} | #{board[10]} | #{board[11]} | #{board[12]} | #{board[13]} |"
    puts '|----+----+----+----+----+----+----|'
    puts "| #{board[0]} | #{board[1]} | #{board[2]} | #{board[3]} | #{board[4]} | #{board[5]} | #{board[6]} |"
    puts '|----+----+----+----+----+----+----|'
    puts '|  1 |  2 |  3 |  4 |  5 |  6 |  7 |'
  end

  def update(column, token)
    original_board = @board.dup
    for i in (0..5)
      next unless @board[(column + 7 * i) - 1] == '  '

      @board[(column + 7 * i) - 1] = token
      break

    end
    original_board.each_with_index.find do |value, index|
      value != @board[index]
    end
  end

  def full?
    @board.none? { |element| element == '  ' }
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Style/For
# rubocop:enable Metrics/MethodLength
