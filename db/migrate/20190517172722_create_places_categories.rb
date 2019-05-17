class CreatePlacesCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :places_categories do |t|
      t.references :place, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
