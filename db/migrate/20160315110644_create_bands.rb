class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, null: false
      t.timestamps null: false
      t.string :url_name,  null: false
    end
    add_index :bands, :url_name
  end
end
