class AddUserToPizzaOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :pizza_orders, :user, null: false, foreign_key: true
  end
end
