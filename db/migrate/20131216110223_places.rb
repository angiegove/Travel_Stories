class Places < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :title
      t.string :latitude
      t.string :longitude
      t.string :image
      t.integer :trip_id
      t.text :story

      t.timestamps
    end
  end
end
