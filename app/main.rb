# frozen_string_literal: true

require './app/bowling_game'
require './app/scorehead'
require './app/game'

bowling = BowlingGame.new
game = Game.new(bowling)
game.user_game
