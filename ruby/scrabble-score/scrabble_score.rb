#! /usr/bin/env ruby

## Scoring Scrabble using a modifier array representing the tile setup:
##         K         W    I   J   I        B          O        S
## [[:DW, "shook"], nil, nil, 0, nil, [:DL, "bale"], nil, [:TW, "sincerity"]]
##
class Scrabble
  EN_US_TILES = { a: 1, b: 3, c: 3, d: 2, e: 1, f: 4, g: 2, h: 4, i: 1,
                  j: 8, k: 5, l: 1, m: 3, n: 1, o: 1, p: 3, q: 10, r: 1,
                  s: 1, t: 1, u: 1, v: 4, w: 4, x: 8, y: 4, z: 10 }.freeze

  MAX_TILES_PER_PLAY = 7

  attr_reader :score

  def initialize(word, modifiers = [])
    @score = Scrabble.score(word)
    @modifiers = modifiers
  end

  def score(word, _modifiers = [])
    return 0 if word.nil?
    word.chars.reduce(0) { |acc, elem| acc + points(elem.downcase) }
  end

  protected

  def raw_score(word)
    return 0 if word.nil?
    word.chars.reduce(0) { |acc, elem| acc + points(elem.downcase) }
  end

  class << self
    private

    def points(char)
      EN_US_TILES[char.to_sym] || 0
    end
  end
end

require 'minitest/autorun'
require 'minitest/pride'
## Additional tests for Scrabble's format extension.
class ScrabbleTest < Minitest::Test
  def test_empty_mofifer_array_accepted_by_scrore_method
    assert_equal 0, Scrabble.score('quay', [])
  end
end
