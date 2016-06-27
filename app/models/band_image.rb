class BandImage < ActiveRecord::Base
	include Attachable
	belongs_to :band
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
