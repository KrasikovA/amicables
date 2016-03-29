class Admin::BackImagesController < ApplicationController
	def about_create
		old_about_back = BackImage.find_by(name: 'about')
		old_about_back.destroy! if !old_about_back.nil?
		new_about_back = BackImage.new(back_image_params)
		new_about_back.name = 'about'
		new_about_back.save!
		
		redirect_to admin_about_path
	end

	def bands_create
		old_about_back = BackImage.find_by(name: 'bands')
		old_about_back.destroy! if !old_about_back.nil?
		new_about_back = BackImage.new(back_image_params)
		new_about_back.name = 'bands'
		new_about_back.save!
		
		redirect_to admin_bands_path
	end

	def releases_create
		old_about_back = BackImage.find_by(name: 'releases')
		old_about_back.destroy! if !old_about_back.nil?
		new_about_back = BackImage.new(back_image_params)
		new_about_back.name = 'releases'
		new_about_back.save!
		
		redirect_to admin_bands_path
	end
	private 
	def back_image_params
		params.require(:back_image).permit!
	end
end