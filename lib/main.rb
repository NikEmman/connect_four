# frozen_string_literal: true

require_relative 'game'
require_relative 'speech'
require 'io/console'

class Main
  def play
    loop do
      game = Game.new
      game.play
      Speech.restart
      break unless gets.chomp.downcase == 'y'

      $stdout.clear_screen
    end
  end
end

a = Main.new
a.play
