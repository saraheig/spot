class AddIndexOnPlaceAndCategory < ActiveRecord::Migration[5.2]
  def change
    add_index :places, :title, unique: true
    add_index :categories, :title, unique: true
  end
end
