class CreateUsers < ActiveRecord::Migration[6.0]
  def up
    create_table :users do |t|
      t.string :pseudo, limit: 20, null: false
      t.string :email, limit: 50
      t.string :password_digest
      t.references :language, foreign_key: true
      t.timestamps
    end

    add_index :users, :pseudo, unique: true
  end

  def down
    drop_table :users
  end
end
