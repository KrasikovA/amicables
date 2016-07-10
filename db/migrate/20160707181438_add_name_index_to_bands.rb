class AddNameIndexToBands < ActiveRecord::Migration
  def up
		execute %{
			CREATE UNIQUE INDEX
				bands_name
			ON
				bands (lower(name) varchar_pattern_ops)
		}
	end
	def down
		remove_index :bands,name: "bands_name"
	end
end
