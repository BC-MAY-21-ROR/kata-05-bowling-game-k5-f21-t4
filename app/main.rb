# frozen_string_literal: true

require './app/bowling_game'

# frozen_string_literal: true

game = BowlingGame.new

game.game
puts game.board.inspect

game.show_results
