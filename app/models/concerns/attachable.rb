module Attachable
	extend ActiveSupport::Concern
	included do
		has_attached_file :image
		def image_url
			image.url
		end
	end
end