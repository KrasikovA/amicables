class Admin::ReleasesController < ApplicationController
	include Backgroundable
	layout :resolve_background
	def index
		@bands = Band.all
	end

	def new
		@band = Band.find(params[:band_id])
		@release = @band.releases.build
		@release.release_images.build
		@release.tracks.build
	end
	
	def create
		debugger
		band = Band.find(params[:band_id])
		@release = band.releases.build(release_params)
		
		if (release_params[:release_images_attributes])
			release_params[:release_images_attributes].each do |key,value|
				@release.release_images.build(value)
			end
		end

		if (release_params[:release_tracks_attributes])
			release_params[:release_tracks_attributes].each do |key,value|
				@release.tracks.build(value)
			end
		end
		if @release.save!
			redirect_to admin_releases_path
		else
			render status: 500
		end
	end

	def edit
	
	end

	def update

	end

	def delete

	end
	private
	def resolve_background
		case action_name
		when "new"
			'admin_no_slider'
		else
			'admin'
		end
	end

	def release_params
		params.require(:release).permit!
	end

end