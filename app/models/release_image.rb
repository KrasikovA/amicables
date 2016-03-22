class ReleaseImage < ActiveRecord::Base
  include Attachable
  belongs_to :releases
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
