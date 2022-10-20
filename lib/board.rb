class Board

    attr_accessor :board_array

    def initialize
        board_rows = Array.new(3)
        @board_array = board_rows.map { |_y| Array.new(3, '  ') }
    end
    
    def show_board
        puts
        puts "  A     B     C".bold
        print "1".bold
        puts " #{@board_array[0][0]}    #{@board_array[0][1]}    #{@board_array[0][2]} "
        puts " "
        print "2".bold
        puts " #{@board_array[1][0]}    #{@board_array[1][1]}    #{@board_array[1][2]} "
        puts " "
        print "3".bold
        puts " #{@board_array[2][0]}    #{@board_array[2][1]}    #{@board_array[2][2]} "
        puts
    end

    def free_case? (x, y)
        if @board_array[x][y] == "  "
           return true
        else
           return false
        end
    end

    def won?
        rows = check_rows
        columns = check_columns
        diagonals = check_diagonals

        return true if rows == true || columns == true || diagonals == true
    end

    def check_rows
        (0..2).each do |x|
            return true if @board_array[x][0] == @board_array[x][1] && @board_array[x][1] == @board_array[x][2] && @board_array[x][0] != "  "
        end
    end

    def check_columns
        (0..2).each do |x|
            return true if @board_array[0][x] == @board_array[1][x] && @board_array[1][x] == @board_array[2][x] && @board_array[0][x] != "  "
        end
    end

    def check_diagonals
        return true if @board_array[0][0] == @board_array[1][1] && @board_array[1][1] == @board_array[2][2] && @board_array[0][0] != "  " || @board_array[0][2] == @board_array[1][1] && @board_array[1][1] == @board_array[2][0] && @board_array[0][2] != "  "
    end

    def puts_symbol(x, y, symbol)
        @board_array[x][y] = symbol
    end

end