class BackImage < ActiveRecord::Base
	include Attachable
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
