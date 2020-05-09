class AddAdminUserIdToPlace < ActiveRecord::Migration[6.0]
  def up
    add_reference :places, :admin_user, foreign_key: false
    add_column :places, :approved, :boolean, default: false
  end

  def down
    remove_reference :places, :admin_user
    remove_column :places, :approved
  end
end
