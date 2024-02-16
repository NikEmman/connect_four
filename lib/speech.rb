# frozen_string_literal: true

class Speech
  WELCOME = 'Welcome to Connect Four'
  CREATE_P1 = 'Hello Player 1, what is your name?'
  CREATE_P2 = 'Hello Player 2, what is your name?'
  HELP = 'This is the help text'
  WRONG_INPUT = 'Wrong input or column is full, please choose a number between 1 and 7'

  def self.welcome
    puts WELCOME
  end

  def self.create_p1
    puts CREATE_P1
  end

  def self.create_p2
    puts CREATE_P2
  end

  def self.ask_input(name)
    puts "#{name} what is your next move?"
  end

  def self.help
    puts HELP
  end

  def self.wrong_input
    puts WRONG_INPUT
  end
end
