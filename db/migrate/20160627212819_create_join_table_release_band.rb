class CreateJoinTableReleaseBand < ActiveRecord::Migration
  def change
    create_join_table :releases, :bands, table_name: "albums" do |t|
      t.index [:release_id, :band_id]
      t.index [:band_id, :release_id]
    end
    add_foreign_key :albums, :bands
    add_foreign_key :albums, :releases
  end
end
