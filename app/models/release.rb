class Release < ActiveRecord::Base
	has_and_belongs_to_many :bands
	has_many :tracks
	has_many :release_images
	accepts_nested_attributes_for :release_images, reject_if: lambda { |t| t['trip_image'].nil? }
	accepts_nested_attributes_for :tracks
end
