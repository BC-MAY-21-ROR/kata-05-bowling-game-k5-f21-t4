# frozen_string_literal: true

require './app/bowling_game'

# Class to show the game score
class ScoreHead
  def self.record_per_turn(frames)
    frames.each { |frame| print "| #{frame[0]} - #{frame[1]} " }
    puts ''
  end

  def self.record_per_frame(frames)
    frames.each { |frame| print "|   #{frame}   " }
    puts ''
  end

  def self.show(board, result)
    record_per_turn(board)
    record_per_frame(result)
  end
end
