class AddDateToPlacesTable < ActiveRecord::Migration
  def change
    add_column :places, :date, :text
  end
end
