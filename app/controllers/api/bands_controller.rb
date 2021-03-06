class Api::BandsController < ApplicationController
	respond_to :json
	def show
		band = Band.find_by(url_name: params[:name])
		respond_with band.to_json(except: [ :created_at,:updated_at],include: {band_images: {methods: :image_url,only: :image_url}})
	end
	def back
		aboutBack = BackImage.find_by(name: 'bands')
		respond_with aboutBack.to_json(methods: :image_url,only: :image_url)
	end
	def all
		bands = Band.select(:name,:id,:url_name)
		respond_with bands.to_json(except: [ :created_at,:updated_at])
	end
	def back
		aboutBack = BackImage.find_by(name: 'about')
		respond_with aboutBack.to_json(methods: :image_url,only: :image_url)
	end
end
