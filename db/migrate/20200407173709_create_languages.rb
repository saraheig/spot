class CreateLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :languages do |t|
      t.string :name, limit: 20
      t.string :code, limit: 5

      t.timestamps
    end
  end
end
