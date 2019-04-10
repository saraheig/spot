class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :title, limit: 40
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.integer :duration, limit: 2
      t.text :schedule
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6

      t.timestamps
    end
  end
end
