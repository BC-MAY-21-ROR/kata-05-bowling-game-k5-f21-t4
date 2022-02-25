# frozen_string_literal: true

require './app/bowling_game'
require './app/scorehead'

# frozen_string_literal: true

# Class to start the game
class Game
  attr_reader :bowling_game

  def initialize(bowling_game)
    @bowling_game = bowling_game
  end

  def game
    @bowling_game.board.size.times { |frame| 2.times { |turn| count_record_per_turn(frame, turn) } }
  end

  def count_record_per_turn(frame, turn)
    @bowling_game.record_knock_down(frame, turn, @bowling_game.make_hit(frame, turn))
    @bowling_game.last_frame(frame) if frame == 9
    update_results if frame < 10
  end

  def update_results
    10.times { |frame| @bowling_game.record_per_frame(frame) }
    @bowling_game.result[9] += @bowling_game.board[9][2]
  end
end

bowling = BowlingGame.new

game = Game.new(bowling)

game.game

ScoreHead.show(game.bowling_game.board, game.bowling_game.result)
