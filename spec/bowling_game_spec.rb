# frozen_string_literal: true

require 'rspec'
require_relative '../app/bowling_game'
require './app/game'

describe BowlingGame do
  game = BowlingGame.new([[0, 1], [2, 8], [10, 0], [4, 3], [7, 3], [2, 1], [3, 5], [5, 5], [7, 1], [10, 0]])

  it 'check spare? method' do
    result = [0, 1, 0, 0, 1, 0, 0, 1, 0, 0]
    test = []
    10.times { |frame| game.spare?(frame) ? test.push(1) : test.push(0) }
    expect(test).to eq result
  end

  it 'check strike? method' do
    result = [0, 0, 1, 0, 0, 0, 0, 0, 0, 1]
    test = []
    10.times { |frame| game.strike?(frame) ? test.push(1) : test.push(0) }
    expect(test).to eq result
  end

  game_two = BowlingGame.new([[1, 4], [4, 5], [6, 4], [5, 5], [10, 0], [0, 1], [7, 3], [6, 4], [10, 0], [2, 8, 6]])
  it 'check update_results' do
    result = [5, 14, 29, 49, 60, 61, 77, 97, 117, 133]
    obj_game = Game.new(game_two)
    obj_game.update_results
    expect(game_two.result).to eq result
  end
end
