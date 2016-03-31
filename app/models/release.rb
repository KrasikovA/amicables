class Release < ActiveRecord::Base
	belongs_to :band
	has_many :tracks
	has_many :release_images
	accepts_nested_attributes_for :release_images, reject_if: lambda { |t| t['trip_image'].nil? }
	accepts_nested_attributes_for :tracks
end
