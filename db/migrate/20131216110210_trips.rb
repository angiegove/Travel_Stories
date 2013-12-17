class Trips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
