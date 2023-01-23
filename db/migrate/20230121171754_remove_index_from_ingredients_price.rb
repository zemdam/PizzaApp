class RemoveIndexFromIngredientsPrice < ActiveRecord::Migration[7.0]
  def change
    remove_index :ingredients_prices, name: 'index_ingredients_prices_on_cheese_price_and_ham_price_and_sauce_price_and_pineapple_price'
  end
end
