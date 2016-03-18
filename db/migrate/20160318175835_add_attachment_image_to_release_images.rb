class AddAttachmentImageToReleaseImages < ActiveRecord::Migration
  def self.up
    change_table :release_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :release_images, :image
  end
end
