class AddColumnToPizzaOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :pizza_orders, :pizzeria_point, null: false, foreign_key: true
  end
end
