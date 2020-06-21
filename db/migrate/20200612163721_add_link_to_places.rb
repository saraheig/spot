class AddLinkToPlaces < ActiveRecord::Migration[6.0]
  def up
    add_column :places, :url, :string, limit: 250
  end

  def down
    remove_column :places, :url
  end
end
