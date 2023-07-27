class CreateIngredientsPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients_prices do |t|
      t.integer :cheese_price, null: false
      t.integer :ham_price, null: false
      t.integer :sauce_price, null: false
      t.integer :pineapple_price, null: false

      t.timestamps
    end
    add_index :ingredients_prices, [:cheese_price, :ham_price, :sauce_price, :pineapple_price], unique: true, name: "prices_index"
  end
end
