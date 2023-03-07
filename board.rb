class Board 
    

    def initialize(size = 3)
        @board = Array.new(size,"_"){Array.new(size,"_")}
        size 
    end

    def show_board 
    
        @board.each do |row|
            p row
        end
        
    end

    def empty?(pos)
        self[pos] == "_"
    end

    def place_mark(pos,mark)
        row = pos[0]
        col = pos[1]

        @board[row][col] = mark 
    end

    def valid_position?(pos)
        row = pos[0]
        col = pos[1]

        if @board[row][col] != nil 
            return true

        else
            return false
        end

    end

  

    def horizinatal_winner?(mark)
        @board.any? do |row|
            row.all?(mark)
        end

    end


    def vertical_winner?(mark)
    transposed = @board.transpose

        transposed.any? do |column|
          column.all?(mark)
        end

    end

    def diagonal_winner?(mark)

    ne = []
    nw = []
    
    index =0
    
    i = 0
        while i < @board.length 
            ne.push(@board[i][index])
            i+=1
            index+=1
        end
    
    index = 2 
    
    j = 0 
        while j < @board.length 
            nw.push(@board[j][index])
            index-=1
            j+=1
        end
    
    
    if ne.all?(mark) || nw.all?(mark)
        return true 
    
    else
        return false 
    end

    end


    def game_over?
        if horizintal_winner?(mark) || vertical_winner?(mark) || diagonal_winner?(mark)
            return true 
        end

        return false 
    end

    def board_full?

        @board.each do |row|
          row.each do |value|
            if value === "_"
              return false 
            end
          end
        end
      
        return true 
        
      end
end

