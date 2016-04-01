class Track < ActiveRecord::Base
  belongs_to :release
  has_attached_file :song
  validates_attachment_content_type :song, content_type: ['audio/mp3','audio/wav']
  	def song_url
		song.url
	end
end

