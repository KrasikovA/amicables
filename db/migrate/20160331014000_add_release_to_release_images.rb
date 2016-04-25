class AddReleaseToReleaseImages < ActiveRecord::Migration
  def change
  	add_reference :release_images, :releases, index: true, foreign_key: true
  end
end
