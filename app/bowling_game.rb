# frozen_string_literal: true

# Class to start the bowling game
class BowlingGame
  attr_reader :board, :result

  def initialize(board = Array.new(10) { Array.new(2) { 0 } })
    @board = board
    @result = Array.new(10) { 0 }
    @board[9][2] = 0 if @board[9][2].nil?
  end

  def record_knock_down(frame, turn, pins_knock_down)
    @board[frame][turn] = pins_knock_down
  end

  def last_frame(frame)
    (record_knock_down(frame, 2, rand(0..10)) if spare?(frame) || strike?(frame))
  end

  def record_per_frame(frame)
    @result[frame] = @board[frame][0] + @board[frame][1]
    @result[frame] += @result[frame - 1] if frame.positive?
    extra_point?(frame) if frame < 9
  end

  def extra_point?(frame)
    @result[frame] += @board[frame + 1][0] if spare?(frame)
    @result[frame] += (@board[frame + 1][0] + @board[frame + 1][1]) if strike?(frame)
  end

  def show_results
    puts @result.inspect
  end

  def make_hit(frame, turn)
    turn.zero? ? rand(0..10) : rand(0..(10 - @board[frame][0]))
  end

  def spare?(frame)
    turn_one = @board[frame][0]
    true if turn_one + @board[frame][1] == 10 && turn_one != 10
  end

  def strike?(frame)
    true if @board[frame][0] == 10
  end
end
