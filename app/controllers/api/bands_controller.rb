class Api::BandsController < ApplicationController
	respond_to :json
	def all
		bands = Band.includes(:band_images)
		respond_with bands.to_json(include: {band_images: {methods: :image_url,only: :image_url}})
	end
end