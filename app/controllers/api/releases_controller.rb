class Api::ReleasesController < ApplicationController
	respond_to :json
	def back
		releasesBack = BackImage.find_by(name: 'releases')
		respond_with releasesBack.to_json(methods: :image_url,only: :image_url)
	end

	def all
		respond_with Album.band_names.to_json
	end

	def show
		releases = Release.find_by_comp_band_name(params[:comp_name])
		respond_with releases.to_json(
			include: {
				release_images: {
					methods: :image_url,
					only: :image_url
				},
				tracks: {
					methods: :song_url
				}
			})
	end

end
