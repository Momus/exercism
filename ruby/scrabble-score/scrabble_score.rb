#! /usr/bin/env ruby

## Scoring Scrabble using tile_layout array representing the tile
## setup.  If a tile is unmodified, the value in the array is nil. If
## the word is formed off

## Example:
##         K      W        I            J    I     B     O         S
## [[:DWS,"shak"],[], [nil,"integral"], [0], [], [:DLS], [], [:TWS,"sincerity"]]
##
##  Tiles played: if 7 then +50 points
class Scrabble
  EN_US_TILES = {
    a: 1, b: 3, c: 3, d: 2, e: 1, f: 4, g: 2, h: 4, i: 1,
    j: 8, k: 5, l: 1, m: 3, n: 1, o: 1, p: 3, q: 10, r: 1,
    s: 1, t: 1, u: 1, v: 4, w: 4, x: 8, y: 4, z: 10
  }.freeze

  MAX_TILES_PER_PLAY = 7

  TILE_MODIFIERS = {
    TLS: 3, DLS: 2,
    TWS: 3, DWS: 2
  }.freeze
  ## Instance variables that may get hid.
  @tiles_played = 0
  @word_multipler = nil

  attr_reader :score

  def initialize(word, tile_layout = [[]])
    @tile_layout = tile_layout
    @score = Scrabble.score(word)
  end

  class << self
    def score(word)
      return 0 if word.nil?
      word.chars.reduce(0) { |acc, elem| acc + points(elem.downcase) }
    end

    ##    protected

    def raw_score(word)
      return 0 if word.nil?
      word.chars.reduce(0) { |acc, elem| acc + points(elem.downcase) }
    end

    def lay_score(word)
      word.chars.each_with_index do | c, i |
        case @title_layout[i][0]
        when :TLS
          @word_multipler += 3
        when :DWS
          @word_multipler += 2
        when 0
          word[i] = ' '
        when :TWS
          print "3"
        when :DWS
          print "2"
        end
      end
      
    end

    private

    def points(char)
      EN_US_TILES[char.to_sym] || 0
    end
  end
end

require 'minitest/autorun'
require 'minitest/pride'
## Additional tests for Scrabble's format extension.
class AdditoinalScrabbleTests < Minitest::Test
  def test_empty_mofifer_array_accepted_by_scrore_method
    assert_equal 16, Scrabble.score('quay', [])
  end
end
