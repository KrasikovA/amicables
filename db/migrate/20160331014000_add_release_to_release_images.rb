class AddReleaseToReleaseImages < ActiveRecord::Migration
  def change
    add_column :release_images, :releases_id, :reference
  end
end
