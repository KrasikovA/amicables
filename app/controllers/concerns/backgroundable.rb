module Backgroundable
	extend ActiveSupport::Concern

	included do
		before_action :set_backs,only: :index
		private 
		def set_backs
			background = params[:controller].gsub('admin/','')
			@new_back = BackImage.new
			@old_back = BackImage.find_by name: background
		end
	end
end