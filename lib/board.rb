# rubocop:disable Style/For
# rubocop:disable Metrics/AbcSize
# frozen_string_literal: true

# token representation red_token = "\u{1F534}", yellow_token = "\u{1F7E1}"

# board = [
#     [" ", " ", " ", " ", " ", " ", " "],
#     ["🟡", " ", " ", " ", " ", " ", " "],
#     ["🔴", " ", " ", " ", " ", " ", " "],
#     ["🟡", " ", " ", " ", " ", " ", " "],
#     ["🔴", " ", " ", " ", " ", " ", " "],
#     ["🟡", " ", " ", " ", " ", " ", " "]
#   ]

#   board.each do |row|
#     puts row.join(" | ")
#   end

#   puts "  1   2   3   4   5   6   7"
class Board
  attr_accessor :board

  def initialize(board = [
    ' ', ' ', ' ', ' ', ' ', ' ', ' ',
    ' ', ' ', ' ', ' ', ' ', ' ', ' ',
    ' ', ' ', ' ', ' ', ' ', ' ', ' ',
    ' ', ' ', ' ', ' ', ' ', ' ', ' ',
    ' ', ' ', ' ', ' ', ' ', ' ', ' ',
    ' ', ' ', ' ', ' ', ' ', ' ', ' '
  ])
    @board = board
  end

  def display # rubocop:disable Metrics/MethodLength
    puts "| #{board[36]} | #{board[37]} | #{board[38]} | #{board[39]} | #{board[40]} | #{board[41]} | #{board[42]}  |"
    puts '|---+---+---+---+---+---+---|'
    puts "| #{board[28]} | #{board[29]} | #{board[30]} | #{board[31]} | #{board[32]} | #{board[33]} | #{board[35]} |"
    puts '|---+---+---+---+---+---+---|'
    puts "| #{board[21]} | #{board[22]} | #{board[23]} | #{board[24]} | #{board[25]} | #{board[26]} | #{board[27]} |"
    puts '|---+---+---+---+---+---+---|'
    puts "| #{board[14]} | #{board[15]} | #{board[16]} | #{board[17]} | #{board[18]} | #{board[19]} | #{board[20]} |"
    puts '|---+---+---+---+---+---+---|'
    puts "| #{board[7]} | #{board[8]} | #{board[9]} | #{board[10]} | #{board[11]} | #{board[12]} | #{board[13]} |"
    puts '|---+---+---+---+---+---+---|'
    puts "| #{board[0]} | #{board[1]} | #{board[2]} | #{board[3]} | #{board[4]} | #{board[5]} | #{board[6]} |"
    puts '|---+---+---+---+---+---+---|'
    puts '| 1 | 2 | 3 | 4 | 5 | 6 | 7 |'
  end

  def update(column, token)
    for i in (0..5)
      next unless @board[(column + 7 * i) - 1] == ' '

      @board[(column + 7 * i) - 1] = token
      break

    end
  end

  def valid?(column)
    true if (1..7).include?(column) && column_not_full?(column)
  end

  def column_not_full?(column)
    for i in (0..5)
      return true if @board[(column + 7 * i) - 1] == ' '
    end
    false
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Style/For
