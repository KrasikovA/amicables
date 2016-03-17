class Band < ActiveRecord::Base
	has_many :releases
	has_many :band_images, dependent: :destroy
	accepts_nested_attributes_for :band_images, reject_if: lambda { |t| t['trip_image'].nil? }
	def as_json(options = {})
    	super(options.merge(include: :releases))
  	end
end
