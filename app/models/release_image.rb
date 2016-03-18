class ReleaseImage < ActiveRecord::Base
  belongs_to :releases
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
  def image_url
  	image.url
  end
end
