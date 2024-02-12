# frozen_string_literal: true

class Speech
  WELCOME = 'Welcome to Connect Four'
  CREATE_P1 = 'Hello Player 1, what is your name?'
  CREATE_P2 = 'Hello Player 2, what is your name?'
  HELP = 'This is the help text'
  WRONG_INPUT = 'Wrong input, please choose a number between 1 and 7'

  def welcome
    puts WELCOME
  end

  def create_p1
    puts CREATE_P1
  end

  def create_p2
    puts CREATE_P2
  end

  def ask_input(name)
    puts "#{name} what is your next move?"
  end

  def help
    puts HELP
  end

  def wrong_input
    puts WRONG_INPUT
  end
end
