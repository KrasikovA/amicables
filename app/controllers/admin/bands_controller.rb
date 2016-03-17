class Admin::BandsController < ApplicationController
	def index
	end
	def new
		@band = Band.new
		3.times {@band.band_images.build}
	end
	def create
		@band = Band.new(band_params)
		if (band_params[:band_images_attributes])
			band_params[:band_images_attributes].each do |key,value|
				@band.band_images.build(value)
			end
		end
		if @band.save
			redirect_to :admin
		else
			render action: 'new'
		end
	end
	def edit
		
	end
	def show
		
	end
	def update
		
	end
	private 
	def band_params
		params.require(:band).permit!
	end
end
