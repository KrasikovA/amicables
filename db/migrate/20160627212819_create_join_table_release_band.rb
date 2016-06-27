class CreateJoinTableReleaseBand < ActiveRecord::Migration
  def change
    create_join_table :releases, :bands do |t|
      t.index [:release_id, :band_id]
      t.index [:band_id, :release_id]
    end
    add_foreign_key :bands_releases, :bands
    add_foreign_key :bands_releases, :releases
  end
end
