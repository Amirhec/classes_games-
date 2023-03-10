class Player
    attr_reader :name, :mark
  
    def initialize(name, mark)
      @name = name
      @mark = mark
    end
  
    def get_position
      puts "#{@name}, enter the row and column you want to place your mark (example:  '1 2')"
      pos = gets.chomp.split(" ").map(&:to_i)
  
      until pos.length == 2
        puts "Invalid position. #{@name}, enter the row and column you want to place your mark (example: '1 2')"
        pos = gets.chomp.split(" ").map(&:to_i)
      end
  
      pos
    end
  end
  