class Admin::AdminController <  ApplicationController
	def index 
		@bands = Band.all
	end
end