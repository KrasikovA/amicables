class Api::ReleasesController < ApplicationController
	respond_to :json
	def back
		releasesBack = BackImage.find_by(name: 'releases')
		respond_with releasesBack.to_json(methods: :image_url,only: :image_url)
	end
end