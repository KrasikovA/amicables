class Admin::AboutController < ApplicationController
	include Backgroundable 
	layout 'admin'
	before_action :set_about_page
	def index
	end

	def update_description
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
		@about_page = AboutPage.first.nil? ? AboutPage.new : AboutPage.first
	end
end