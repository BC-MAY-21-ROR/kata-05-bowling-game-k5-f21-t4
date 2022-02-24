# frozen_string_literal: true

require 'rspec'
require_relative '../app/bowling_game'

describe BowlingGame do
  game = BowlingGame.new
  game.board = [[0, 1], [2, 8], [10, 0], [4, 3], [7, 3], [2, 1], [3, 5], [5, 5], [7, 1], [10, 0]]

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

  it 'check record_per_frame' do
    game.board = [[1, 4], [4, 5], [6, 4], [5, 5], [10, 0], [0, 1], [7, 3], [6, 4], [10, 0], [2, 8, 6]]
    result = [5, 14, 29, 49, 60, 61, 77, 97, 117, 133]
    game.record_per_frame
    expect(game.result).to eq result
  end
end
