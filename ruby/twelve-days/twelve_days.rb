## The Twelve Days if Christmas song.
class TwelveDays
  class << self
    def song
      song_file = File.expand_path('../song.txt', __FILE__)
      IO.read(song_file)
    end
  end
end
