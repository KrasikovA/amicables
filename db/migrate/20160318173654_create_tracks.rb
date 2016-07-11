class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.integer :position, null: false
      t.integer :time, null: false, default: 0
      t.references :release, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
