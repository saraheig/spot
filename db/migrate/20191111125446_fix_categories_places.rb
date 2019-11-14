class FixCategoriesPlaces < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :categories_places, :categories
    remove_foreign_key :categories_places, :places

    rename_table :categories_places, :temps

    create_table :categories_places, id: false do |t|
      t.belongs_to :place
      t.belongs_to :category
    end
  end
end
