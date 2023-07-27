class RemoveIndexFromIngredientsPrice < ActiveRecord::Migration[7.0]
  def change
    remove_index :ingredients_prices, name: 'prices_index'
  end
end
