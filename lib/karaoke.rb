class Song
  attr_reader :name, :artist, :duration
  attr_writer :duration

  @@plays = 0
  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
    @plays = 0
  end

  def duration_in_min
    @duration/60.0
  end

  MAX_DURATION = 1000

  def self.is_song_too_long(song)
    return song.duration > MAX_DURATION
  end

  def play
    @plays += 1
    @@plays += 1
    "This song: #@plays plays. Total songs played: #@@plays."
  end

  def to_s
    "Song: #@name - #@artist (#@duration)"
  end
end

class KaraokeSong < Song
  def initialize(name, artist, duration, lyrics)
    super(name, artist, duration)
    @lyrics = lyrics
  end

  def to_s
    super + ": ... #@lyrics"
  end
end

song = Song.new("Don't move","Phantogram",245)
song.artist
song.name
song.duration = 240
song.duration_in_min
song.to_s
ksong = KaraokeSong.new("Mouthful of Diamonds","Phantogram",231,"I wish I could believe ...")
ksong.to_s

song.play
song.play
ksong.play
ksong.play

song.duration = 2400
Song.is_song_too_long(song)
Song.is_song_too_long(ksong)

class SongList
  def initialize
    @songs = Array.new
  end

  def append(song)
    @songs.push(song)
    self
  end

  def delete_first
    @songs.shift
  end

  def delete_last
    @songs.pop
  end

  def [](index)
    @songs[index]
  end

  def with_title(title)
#    for i in 0..@songs.length
#      return @songs[i] if title == @songs[i].name
#    end
#    return nil
  @songs.find{|song| title == song.name()}
  end
end

require 'test/unit'

class TestSongList < Test::Unit::TestCase
  def test_delete
    list = SongList.new
    s1 = Song.new('title1','artist1',1)
    s2 = Song.new('title2','artist2',2)
    s3 = Song.new('title3','artist3',3)
    s4 = Song.new('title4','artist4',4)
    list.append(s1).append(s2).append(s3).append(s4)

    assert_equal(s1, list[0])
    assert_equal(s3, list[2])
    assert_nil(list[9])
    assert_equal(s1, list.delete_first())
    assert_equal(s2, list.delete_first())
    assert_equal(s4, list.delete_last())
    assert_equal(s3, list.delete_last())
    assert_nil(list.delete_last())
  end
def test_name
   list = SongList.new
   s1 = Song.new('title1','artist1',1)
   s2 = Song.new('title2','artist2',2)
   s3 = Song.new('title3','artist3',3)
   s4 = Song.new('title4','artist4',4)
   list.append(s1).append(s2).append(s3).append(s4)

   assert_equal(s3, list.with_title('title3'))
end
end

## closure example
class JukeBoxButton
  #class JukeBoxButton < Button
  def initialize(label,&action)
#    super(label)
    @action = action
  end
  def button_pressed
    action.call(self)
  end
end

sButton = JukeBoxButton.new("Start") { puts "Start pressed"}
pButton = JukeBoxButton.new("Pause") { puts "Pause pressed"}
