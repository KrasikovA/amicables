class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.timestamps null: false
      t.string :url_name
    end
    add_index :bands, :url_name
  end
end
