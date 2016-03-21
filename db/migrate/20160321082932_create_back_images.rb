class CreateBackImages < ActiveRecord::Migration
  def change
    create_table :back_images do |t|

      t.timestamps null: false
    end
  end
end
