class AddReleaseToReleaseImages < ActiveRecord::Migration
  def change
    add_column :release_images, :release_id, :reference
  end
end
