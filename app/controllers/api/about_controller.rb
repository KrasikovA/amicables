class Api::AboutController < ApplicationController
	respond_to :json
	def back
		aboutBack = BackImage.find_by(name: 'about')
		respond_with aboutBack.to_json(methods: :image_url,only: :image_url)
	end
	def description
		about_page = AboutPage.first
		respond_with about_page.to_json(only: :description)
	end
end