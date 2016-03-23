class Admin::AboutController < ApplicationController
	layout 'admin'
	def index
		@about_back = BackImage.find_by name: 'about'
		@new_about_back = BackImage.new
	end
end