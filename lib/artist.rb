class Artist
  attr_accessor :name, :songs
  @@all = []



  def initialize(name)
    @name = name
    @songs = []
  end




  def add_song(song)
@songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    if self.find(name)
      self.find(name)
    else
      self.create(name)
    end
  end

  def self.find(name)
    self.all.detect{ |artist| artist.name == name }
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def print_the_songs
    self.songs.each {|song| song.name}
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
  attr_accessor :artist, :name

  def initialize(name)
    @name = name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def self.new_by_filename(file)
    song_info = file.chomp(".mp3").split(" - ")
    song = Song.new(song_info[1])
    song.artist_name = song_info[0]
    song
  end
end




class MP3Importer
    attr_accessor :path

    def initialize(path)
      @path = path
    end

    def files
      files = []
      Dir.new(self.path).each do |file|
        files << file if file.length > 4
      end
      files
    end



  def import
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end
  end

end
