require "./board.rb"
require "./player.rb"
class Game


    def initialize

    system "clear "

    puts dramatic("Welcome to Tic Tac Toe!")

    puts dramatic("Player 1, what is your name?")
    player_1_name = gets.chomp.to_s.strip

    system "clear "

    puts dramatic("#{player_1_name}, what will your mark be?")
    player_1_mark = gets.chomp.to_s.strip

    system "clear "

    puts dramatic("Player 2, what is your name?")
    player_2_name = gets.chomp.to_s.strip

    system "clear "

    puts dramatic("#{player_2_name}, what will your mark be?")
    player_2_mark = gets.chomp.to_s.strip

    @player_1 = Player.new(player_1_name, player_1_mark)
    @player_2 = Player.new(player_2_name, player_2_mark)

    @current_player = @player_1 

    system "clear"

    puts dramatic("What do you want the size of the board to be?")

    num = gets.chomp.to_i

    
    
    @board = Board.new(num)

    system "clear"

    game_play

    end

    def switch_turn
        if @current_player == @player_1 
           @current_player = @player_2 

        else 
            @current_player = @player_1
        end
    end

    def dramatic(string)
        i = 0 
            while i < string.length 
                print string[i] 
                sleep 0.05
                i+=1
            end
    end


    def game_play

        while @board.board_full? == false
            system "clear"
            @board.show_board
            pos = @current_player.get_position

            if @board.valid_position?(pos) == true

            @board.place_mark(pos,@current_player.mark)

            else
                puts "You can't place it there try again"

                sleep 1 

                next 
               
            end

            if @board.winner?(@current_player.mark)
                puts "player #{@current_player.name.to_s} has won"
                break 

            else 
                switch_turn 
            end
        end

       if @board.board_full?
        puts "game is a draw"
       end

       puts "do you want to play again? y/n"

       choice = gets.chomp.to_s

       if choice === "y"
        new_game = Game.new
        new_game.game_play
       else

        puts "thank you for playing"

       end
    end
    

    

end