class Api::AboutController < ApplicationController
	respond_to :json
	def back
		aboutBack = BackImage.find_by(name: 'about')
		respond_with aboutBack.to_json(methods: :image_url,only: :image_url)
	end
end