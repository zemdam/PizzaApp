class AddIndexToIngdredientsPrice < ActiveRecord::Migration[7.0]
  def change
    add_index :ingredients_prices, :name, unique: true
  end
end
