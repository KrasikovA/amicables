class Api::ReleasesController < ApplicationController
	respond_to :json
	def back
		releasesBack = BackImage.find_by(name: 'releases')
		respond_with releasesBack.to_json(methods: :image_url,only: :image_url)
	end

	def all
		respond_with Album.all.to_json
	end

	def show
		p params[:comp_name]
		respond_with {}.to_json
	end

end