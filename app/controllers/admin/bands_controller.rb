class Admin::BandsController < ApplicationController
	layout 'admin'
	before_action :set_band, only: [:show, :edit, :update, :destroy]
	def index
		@bands = Band.all
	end
	def show
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
	def update
	end
	def destroy
		band.destroy
		redirect_to '/admin/bands'
	end
	private 
	def band_params
		params.require(:band).permit!
	end
	def set_band
		@band = Band.find(params[:id])
	end
end
