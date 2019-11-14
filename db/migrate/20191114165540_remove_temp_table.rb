class RemoveTempTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :temps
  end
end
