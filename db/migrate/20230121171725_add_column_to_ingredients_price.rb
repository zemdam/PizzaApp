class AddColumnToIngredientsPrice < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients_prices, :name, :string, null: false
  end
end
