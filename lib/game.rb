class Game

    attr_accessor :game_number, :player_now, :player1, :player2, :board, :round_number

    def initialize(name1, name2)
        @board = Board.new
        @round_number = 1
        @player1 = Player.new(name1.upcase, "💩")
        @player2 = Player.new(name2.upcase, "🌸")
    end

    def new_round
        @round_number += 1
        @board = Board.new
    end

    def my_turn? (i)
        if i.even?
            @player_now = @player1
        else
            @player_now = @player2
        end
    end

    def player_play (string)
        case
        when string == "A1" && @board.free_case?(0, 0)
                return @board.puts_symbol(0, 0, @player_now.symbol)
        when string == "A2" && @board.free_case?(1, 0)
                return @board.puts_symbol(1, 0, @player_now.symbol)
        when string == "A3" && @board.free_case?(2, 0)
                @board.puts_symbol(2, 0, @player_now.symbol)
        when string == "B1" && @board.free_case?(0, 1)
                @board.puts_symbol(0, 1, @player_now.symbol)
        when string == "B2" && @board.free_case?(1, 1)
                @board.puts_symbol(1, 1, @player_now.symbol)
        when string == "B3" && @board.free_case?(2, 1)
                @board.puts_symbol(2, 1, @player_now.symbol)
        when string == "C1" && @board.free_case?(0, 2)
                @board.puts_symbol(0, 2, @player_now.symbol)
        when string == "C2" && @board.free_case?(1, 2)
                @board.puts_symbol(1, 2, @player_now.symbol)
        when string == "C3" && @board.free_case?(2, 2)
                @board.puts_symbol(2, 2, @player_now.symbol)
        else
            puts " ❗️❗️ TU NE PEUX PAS JOUER DANS CETTE CASE ❗️❗️ ".red.bold
            puts
            return false
        end
    end

    def play_round
        9.times do |i|
            system 'clear'
            puts puts puts
            puts " >  #{@player1.name}    SYMBOLE: #{@player1.symbol}    NB DE VICTOIRES: #{@player1.victory} 🏆 ".cyan.bold
            puts
            puts " >  #{@player2.name}    SYMBOLE: #{@player2.symbol}    NB DE VICTOIRES: #{@player2.victory} 🏆 ".magenta.bold
            puts puts
            puts " 🚨 " + " ROUND N°#{round_number} ".bold.bg_red + " 🚨 "
            @board.show_board
            my_turn?(i)
            loop do
                puts " DANS QUELLE CASE VEUX TU JOUER ? "
                print " > ".green.bold
                input = gets.chomp.to_s.upcase
                if player_play(input) != false
                    break
                end
            end
            if @board.won? == true
                system 'clear'
                @player_now.victory +=1
                puts puts puts
                puts " >  #{@player1.name}    SYMBOLE: #{@player1.symbol}    NB DE VICTOIRES: #{@player1.victory} 🏆 ".cyan.bold
                puts
                puts " >  #{@player2.name}    SYMBOLE: #{@player2.symbol}    NB DE VICTOIRES: #{@player2.victory} 🏆 ".magenta.bold
                puts puts
                puts " 🚨 " + " ROUND N°#{round_number} ".bold.red + " 🚨 "
                @board.show_board
                puts
                puts " 🥇🏆  BRAVO #{@player_now.name} TU AS DÉMONTÉ TON ADVESAIRE  🏆🥇 ".bold.green
                break
            end
        end
    end
end