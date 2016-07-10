class AddIndexToBandsUrlName < ActiveRecord::Migration
  def up
    execute %{
      CREATE UNIQUE INDEX
        url_name
      ON
        bands (lower(name) varchar_pattern_ops)
    }
  end
  def down
    remove_index :bands, :url_name
  end
end
