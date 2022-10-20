class Player
    attr_accessor :name, :symbol, :victory
    
    def initialize (player_name, symbol)
        @name = player_name
        @symbol = symbol
        @victory = 0
    end

end