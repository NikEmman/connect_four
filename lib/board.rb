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
    [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ']
  ])
    @board = board
  end

  def display
    @board.each { |row| puts row.join(' | ') }

    puts '1   2   3   4   5   6   7'
  end

  def update(column, token); end
end
