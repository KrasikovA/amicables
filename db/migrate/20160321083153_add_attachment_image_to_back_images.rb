class AddAttachmentImageToBackImages < ActiveRecord::Migration
  def self.up
    change_table :back_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :back_images, :image
  end
end
