class AddGeometryColumnToPlace < ActiveRecord::Migration[6.0]
  def up
    add_column :places, :geometry, :geometry
    remove_column :places, :lat
    remove_column :places, :lng
  end

  def down
    add_column :places, :lat, :decimal, precision: 10, scale: 6
    add_column :places, :lng, :decimal, precision: 10, scale: 6
    remove_column :places, :geometry
  end
end
