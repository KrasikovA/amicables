class Api::ReleasesController < ApplicationController
	respond_to :json
	def back
		releasesBack = BackImage.find_by(name: 'releases')
		respond_with releasesBack.to_json(methods: :image_url,only: :image_url)
	end

	def images
		release = Release.find(params[:id])
		respond_with release.release_images.to_json(methods: :image_url,only: :image_url)
	end
end