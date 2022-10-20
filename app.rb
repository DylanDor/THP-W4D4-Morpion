require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/color'
require_relative 'lib/display'

system 'clear'
display = Display.new
display.start_text
game = Game.new(display.name1, display.name2)
game.play_round
loop do
    display.new_round_text
    again = gets.chomp.upcase
    if again == "N"
        break
        system clear
        puts puts puts
        puts " 🌸 MERCI D'AVOIR JOUÉ 💩 ".bold
        puts puts puts
    end
    game.new_round
    game.play_round
end


