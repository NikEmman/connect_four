# frozen_string_literal: true

require_relative 'speech'
class Player
  attr_accessor :name, :token

  def initialize(name = nil, token = nil)
    @name = name
    @token = token
  end

  def ask_name
    @name = gets.chomp
  end

  def input
    temp = nil
    loop do
      temp = gets.chomp
      break if (1..7).include?(temp.to_i)

      Speech.new.wrong_input
    end
    temp.to_i
  end
end
