class Api::BandsController < ApplicationController
	respond_to :json
	def back
		aboutBack = BackImage.find_by(name: 'bands')
		respond_with aboutBack.to_json(methods: :image_url,only: :image_url)
	end
	def all
		bands = Band.select(:name,:description,:id)
		respond_with bands.to_json(include: {band_images: {methods: :image_url,only: :image_url}})
	end
	def all_with_releases
		bands = Band.includes(:releases).select(:name,:description,:id)
		respond_with bands.to_json(include: 
			{releases: 
				{include:  
					{tracks:
						{
							methods: :song_url,
							only: :song_url
						},
					release_images: 
						{
							methods: :image_url,
							only: :image_url
						}
					},
				only: [:name,:description,:id]
				}
			})
	end
	def back
		aboutBack = BackImage.find_by(name: 'about')
		respond_with aboutBack.to_json(methods: :image_url,only: :image_url)
	end
	def images
		band_images = Band.find(params[:id]).band_images
		respond_with band_images.to_json(methods: :image_url,only: :image_url)
	end
end