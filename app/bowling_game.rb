# frozen_string_literal: true

# Class to start the bowling game
class BowlingGame
  attr_accessor :board, :result

  def initialize
    @board = Array.new(10) { Array.new(2) { 0 } }
    @result = Array.new(10) { 0 }
    @board[9][2] = 0
  end

  def game
    @board.size.times do |frame|
      2.times do |turn|
        record_knock_down(frame, turn, make_hit(frame, turn))
        last_frame(frame) if frame == 9
      end
      record_per_frame if frame < 10
    end
  end

  def record_per_frame
    10.times do |frame|
      @result[frame] = @board[frame][0] + @board[frame][1]
      @result[frame] += @result[frame - 1] if frame.positive?
      (@result[frame] += @board[frame + 1][0] if spare?(frame)) if frame < 9
      (@result[frame] += (@board[frame + 1][0] + @board[frame + 1][1]) if strike?(frame)) if frame < 9
    end
    @result[9] += @board[9][2]
  end

  def show_results
    puts @result.inspect
  end

  def record_knock_down(frame, turn, pins_knock_down)
    @board[frame][turn] = pins_knock_down
  end

  def last_frame(frame)
    (record_knock_down(frame, 2, rand(0..10)) if spare?(frame) || strike?(frame))
  end

  def make_hit(frame, turn)
    turn.zero? ? rand(0..10) : rand(0..(10 - @board[frame][0]))
  end

  def spare?(frame)
    turn1 = @board[frame][0]
    true if turn1 + @board[frame][1] == 10 && turn1 != 10
  end

  def strike?(frame)
    true if @board[frame][0] == 10
  end
end

# game.board = [[1, 4], [4, 5], [6, 4], [5, 5], [10, 0], [0, 1], [7, 3], [6, 0], [10, 0], [2, 8, 6]]
# it 'check record_per_frame' do
#   result = [5, 14, 29, 29, 60, 61, 77, 97, 117, 133]
#   game.record_per_frame
#   expect(game.result).to eq result
# end
