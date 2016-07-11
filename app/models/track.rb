class Track < ActiveRecord::Base
  belongs_to :release
  has_attached_file :song,
    path:  ":rails_root/public/system/tracks/songs/:id/:style_:basename.:extension",
    url: "/public/system/tracks/songs/:id/:style_:basename.:extension"
  validates_attachment_file_name :song, matches: [/mp3/]
  validates_attachment_size :song, :less_than => 20.megabytes
  after_create :add_time
  def song_url
		song.url
	end
  private
  def add_time
    require 'mp3info'
    Mp3Info.open(self.song.path) do |mp3|
    self.update(time: mp3.length)
  end
  end
end
