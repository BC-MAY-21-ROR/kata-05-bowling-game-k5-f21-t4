#frozen_string_literal: true

# Class to start the bowling game
class BowlingGame
  attr_accessor :board

  def initialize
    @board = Array.new(10) { Array.new(2) { 0 } }
    @result = Array.new(10) { 0 }
  end

  def game
    @board.size.times do |frame|
      2.times do |turn|
        record_knock_down(frame, turn, make_hit(frame, turn))
        last_frame(frame) if frame == 9
      end
    end
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