class RemoveIndexFromPizzaType < ActiveRecord::Migration[7.0]
  def change
    remove_index :pizza_types, name: 'index_pizza_types_on_required_cheese_and_required_sauce_and_required_ham_and_required_pineapple'
  end
end
