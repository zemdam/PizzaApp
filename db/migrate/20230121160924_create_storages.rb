class CreateStorages < ActiveRecord::Migration[7.0]
  def change
    create_table :storages do |t|
      t.integer :available_cheese, null: false
      t.integer :available_ham, null: false
      t.integer :available_sauce, null: false
      t.integer :available_pineapple, null: false
      t.references :pizzeria_point, null: false, foreign_key: true

      t.timestamps
    end
  end
end
