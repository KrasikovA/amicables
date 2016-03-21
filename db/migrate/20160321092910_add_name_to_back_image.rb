class AddNameToBackImage < ActiveRecord::Migration
  def change
    add_column :back_images, :name, :string
  end
end
