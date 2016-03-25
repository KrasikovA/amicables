class Admin::AboutController < ApplicationController
	layout 'admin'
	before_action :set_about_page
	def index
		@about_back = BackImage.find_by name: 'about'
		@new_about_back = BackImage.new
	end

	def update_description
		debugger
		if @about_page.update(description: about_description_params[:description])
			redirect_to '/admin/about'
		else
			render status: 500
		end
	end
	private 
	def about_description_params
		params.require(:about_page).permit(:description)
	end

	def set_about_page
		@about_page = AboutPage.first
	end
end