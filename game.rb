require "board.rb"
require "player.rb"
class Game

    def initialize(mark_1,mark_2)
        @player_1 = HumanPlayer.new(mark_1)
        @player_2 = HumanPlayer.new(mark_2)
        
    end
    

    

end