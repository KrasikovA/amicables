class Band < ActiveRecord::Base
	has_many :releases, dependent: :destroy
	has_many :band_images, dependent: :destroy
	accepts_nested_attributes_for :band_images, reject_if: lambda { |t| t['trip_image'].nil? }
	accepts_nested_attributes_for :releases, reject_if: lambda { |t| t['trip_image'].nil? }
	def images
		@images = band_images
	end
end
