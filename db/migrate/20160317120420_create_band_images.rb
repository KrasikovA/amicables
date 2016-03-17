class CreateBandImages < ActiveRecord::Migration
  def change
    create_table :band_images do |t|

      t.timestamps null: false
    end
  end
end
