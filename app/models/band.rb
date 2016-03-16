class Band < ActiveRecord::Base
	has_many :releases
	def as_json(options = {})
    	super(options.merge(include: :releases))
  	end
end
