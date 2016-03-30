class Api::HomeController < ApplicationController
	respond_to :json
	def back
		homeBack = BackImage.find_by(name: 'home')
		respond_with homeBack.to_json(methods: :image_url,only: :image_url)
	end
end