class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.integer :number
      t.integer :time
      t.references :release, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
