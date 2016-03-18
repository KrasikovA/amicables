class Api::BandsController < ApplicationController
	respond_to :json
	def all
		bands = Band.includes(:band_images).select(:name,:description,:id)
		respond_with bands.to_json(include: {band_images: {methods: :image_url,only: :image_url}})
	end
	def all_with_releases
		bands = Band.includes(:releases).select(:name,:description,:id)
		respond_with bands.to_json(include: :releases)
	end
end