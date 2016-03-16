class BandsController < ApplicationController
	def index
		respond_with Band.all
	end
end
