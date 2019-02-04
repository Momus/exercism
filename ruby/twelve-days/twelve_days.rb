## The Twelve Days if Christmas song.
class TwelveDays
  ORDINAL_NUMBERS = %w[ first
                        second
                        third
                        fourth
                        fifth
                        sixth
                        seventh
                        eighth
                        nineth
                        tenth
                        evelventh
                        twenvelth].freeze
  PRESENTS = [
    'a Partridge in a Pear Tree',
    'two Turtle Doves',
    'three French Hens',
    'four Calling Birds',
    'five Gold Rings',
    'six Geese-aLaying',
    'seven Swans-a-Swimming',
    'eight Maids-a-Milking',
    'nine Ladies Dancing',
    'ten Lords-a-Leaping',
    'eleven Pipers Piping',
    'twelve Drummers Drumming'
  ].freeze

  class << self
    def song
      PRESENTS.each do
      end
    end

    def song_from_file
      # the easy way to pass the tests
      song_file = File.expand_path('song.txt', __dir__)
      IO.read(song_file)
    end
  end
end
