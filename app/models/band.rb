class Band < ActiveRecord::Base
	has_many :albums
	has_many :releases, through: :albums
	has_many :band_images, dependent: :destroy
	accepts_nested_attributes_for :band_images, reject_if: lambda { |t| t['trip_image'].nil? }
	accepts_nested_attributes_for :releases, reject_if: lambda { |t| t['trip_image'].nil? }
	def images
		@images = band_images
	end
	def self.comp_name_ids(comp_name)
		names = comp_name.gsub('_',' ').split('-')
		query = unscoped.where(name: names)
		self.select(:id).where(query.where_values.inject(:or)).map(&:id)
	end
end
