class CreatePizzaOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :pizza_orders do |t|
      t.integer :total_price
      t.integer :ingredients_multiplayer, null: false
      t.datetime :date_of_order
      t.references :pizza_type, null: false, foreign_key: true
      t.references :pizza_size, null: false, foreign_key: true
      t.string :pizzeria_point
      t.string :references
      t.references :client, null: false, foreign_key: true
      t.references :adress, null: false, foreign_key: true

      t.timestamps
    end
  end
end
