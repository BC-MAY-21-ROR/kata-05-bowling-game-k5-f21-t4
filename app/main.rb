class BowlingGame
    
    attr_accessor :board

    def initialize()
        @board = Array.new(10){Array.new(2){0}}
        @result = Array.new(10){0}
    end
    
    def game
        @board.size.times do |frame|
            2.times { |turn| record_knock_down(frame,turn,make_hit(frame,turn)) }
        end
    end

    def record_knock_down(frame, turn, pins_knock_down)
        @board[frame][turn] = pins_knock_down
    end

    def make_hit(frame, turn)
        turn == 0 ? rand(0..10) : rand(0..(10-@board[frame][0]))
    end

    def spare
       # bonus = pins_knock_down
    end
    
    def strike
        #to do
    end
    
    def make_rolls()
        rand(0..10)
    end
end

game = BowlingGame.new()

game.game
puts game.board.inspect

# class BowlingPoints
    
# end

# class BowlingBoard
    
# end