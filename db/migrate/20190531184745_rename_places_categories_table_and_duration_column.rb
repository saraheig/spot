class RenamePlacesCategoriesTableAndDurationColumn < ActiveRecord::Migration[5.2]
  def change
    drop_table :places_categories
    rename_column :places, :duration, :duration_minutes
    rename_column :places, :price, :price_chf

    create_table :categories_places do |t|
      t.references :place, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end

  end
end
