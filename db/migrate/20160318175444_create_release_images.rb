class CreateReleaseImages < ActiveRecord::Migration
  def change
    create_table :release_images do |t|
      t.references :release, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
