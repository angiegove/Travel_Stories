class AddImage3ToPlacesTable < ActiveRecord::Migration
  def change
    add_column :places, :image3, :text
  end
end
