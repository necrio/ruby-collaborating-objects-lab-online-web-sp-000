class Artist
  attr_accessor :name, :songs

@@songs_count = 0


  def initialize(name)
    @name = name
    @songs = []
  end




  def add_song(song)
    self.songs << song
    song.artist = self
    @@songs_count += 1
  end


  #
      def add_song_by_name
      song = Song.new
      self.songs << song
      song.artist = self
      @@songs_count += 1
    end

    def songs
      @songs
    end

    def self.song_count
      @@songs_count
    end

  def songs
    @songs = songs
  end

  def add_song(songs)
    @songs << song
    song.artist = self
    @@song_count += 1
  end
  #
      def add_song_by_name(name)
      song = Artist.new(name)
      @songs << song
      song.artist = self
      @@song_count += 1
    end

    def self.song_count
      @@song_count

    end


end



class Song
  attr_accessor :title

  def self.new_by_filename(filename)
    song = self.new
    song.title = filename.split(" - ")[1]
    song
  end

end

class MP3Importer
  def import(list_of_filenames)
    list_of_filenames.each{ |filename| Song.new_by_filename(filename) }
  end
end
