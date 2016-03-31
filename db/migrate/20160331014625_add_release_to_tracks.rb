class AddReleaseToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :release_id, :reference
  end
end
