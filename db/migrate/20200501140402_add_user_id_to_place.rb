class AddUserIdToPlace < ActiveRecord::Migration[6.0]
  def up
    add_reference :places, :user, foreign_key: false
  end

  def down
    remove_reference :places, :user
  end
end
