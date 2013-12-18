class AddImage2ToPlacesTable < ActiveRecord::Migration
  def change
    add_column :places, :image2, :text
  end
end
