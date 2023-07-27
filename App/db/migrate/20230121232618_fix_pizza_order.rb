class FixPizzaOrder < ActiveRecord::Migration[7.0]
  def change
    remove_column :pizza_orders, :pizzeria_point
    remove_column :pizza_orders, :references
  end
end
