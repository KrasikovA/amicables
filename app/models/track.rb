class Track < ActiveRecord::Base
  belongs_to :releases
  has_attachment :song
end
