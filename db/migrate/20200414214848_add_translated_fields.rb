class AddTranslatedFields < ActiveRecord::Migration[6.0]
  def up
    add_column :categories, :titles, :jsonb, default: {}, null: false
    add_column :categories, :descriptions, :jsonb, default: {}
    add_column :places, :titles, :jsonb, default: {}, null: false
    add_column :places, :descriptions, :jsonb, default: {}
    add_column :places, :schedules, :jsonb, default: {}

    add_index :places, :titles
    add_index :categories, :titles

    remove_column :categories, :title
    remove_column :categories, :description
    remove_column :places, :title
    remove_column :places, :description
    remove_column :places, :schedule
  end

  def down
    remove_column :categories, :titles
    remove_column :categories, :descriptions
    remove_column :places, :titles
    remove_column :places, :descriptions
    remove_column :places, :schedules

    add_column :categories, :title, :string, limit: 20
    add_column :categories, :description, :text
    add_column :places, :title, :string, limit: 40
    add_column :places, :description, :text
    add_column :places, :schedule, :text

    add_index :places, :title, unique: true
    add_index :categories, :title, unique: true
  end
end
