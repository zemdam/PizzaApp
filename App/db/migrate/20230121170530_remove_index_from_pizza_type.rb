class RemoveIndexFromPizzaType < ActiveRecord::Migration[7.0]
  def change
    remove_index :pizza_types, name: 'required_ingredients'
  end
end
