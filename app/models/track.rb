class Track < ActiveRecord::Base
  belongs_to :release
  has_attached_file :song
  validates_attachment_file_name :song, matches: [/mp3/]
  validates_attachment_size :song, :less_than => 20.megabytes
  	def song_url
		song.url
	end
end

