require "./board.rb"
require "./player.rb"
class Game

    def initialize(mark_1,mark_2)
        @player_1 = Player.new(mark_1)
        @player_2 = Player.new(mark_2)
        @current_player = @player_1 
        @board = Board.new 

    end

    def switch_turn
        if @current_player == @player_1 
           @current_player = @player_2 

        else 
            @current_player = @player_1
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
                puts " player #{@current_player.mark.to_s} has won"
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
        new_game = Game.new("O","X")
        new_game.game_play
       else

        puts "thank you for playing"

       end
    end
    

    

end