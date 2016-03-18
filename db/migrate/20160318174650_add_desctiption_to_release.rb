class AddDesctiptionToRelease < ActiveRecord::Migration
  def change
    add_column :releases, :description, :text
  end
end
