# frozen_string_literal: true

require_relative 'speech'
require_relative 'board'
class Player
  attr_accessor :name, :token

  def initialize(name = nil, token = nil)
    @name = name
    @token = token
  end

  def ask_name
    @name = gets.chomp
  end

  def input(board)
    temp = nil
    loop do
      temp = gets.chomp
      break if valid?(board, temp.to_i)

      Speech.wrong_input
    end
    temp.to_i
  end

  def valid?(board, column)
    (1..7).include?(column) && column_not_full?(board, column)
  end

  def column_not_full?(board, column)
    for i in (0..5)
      return true if board[(column + 7 * i) - 1] == '  '
    end
    false
  end
end
