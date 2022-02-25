# frozen_string_literal: true

require './app/bowling_game'

# Class to show the game score
class ScoreHead
  def self.record_per_turn(score, num)
    num.times { |frame| print "|#{score[frame][0]} - #{score[frame][1]}\t" }
    print " - #{score[9][2]}" if score[9][2] != 0
    puts ''
  end

  def self.record_per_frame(score, num)
    num.times { |frame| print "|  #{score[frame]} \t" }
    puts ''
  end

  def self.show(board, result, num)
    record_per_turn(board, num)
    record_per_frame(result, num)
  end
end
