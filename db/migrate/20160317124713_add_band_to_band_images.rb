class AddBandToBandImages < ActiveRecord::Migration
  def change
    add_reference :band_images, :band, index: true, foreign_key: true
  end
end
