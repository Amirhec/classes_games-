class Player 
    attr_reader :mark 

    def initialize(mark) 
        @mark = mark 
    end


    def get_position

        puts "Player #{mark.to_s}, enter the row and column you want to place your mark"

        pos = gets.chomp.split(" ").map(&to_i)

        if pos.length != 2 
            raise "sorry, invalid position try again"
        end

        return pos

      

    end






end