class AddAttachmentImageToBandImages < ActiveRecord::Migration
  def self.up
    change_table :band_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :band_images, :image
  end
end
