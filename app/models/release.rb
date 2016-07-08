class Release < ActiveRecord::Base
	has_many :albums
	has_many :bands, through: :albums
	has_many :tracks
	has_many :release_images
	accepts_nested_attributes_for :release_images, reject_if: lambda { |t| t['trip_image'].nil? }
	accepts_nested_attributes_for :tracks
	def self.find_by_comp_band_name(comp_name)
		band_ids = Band.comp_name_ids(comp_name)
		Release.joins(:albums).where('albums.band_id in (?)',band_ids).distinct
	end
end
