class RemoveClientFromPizzaOrders < ActiveRecord::Migration[7.0]
  def change
    remove_reference :pizza_orders, :client, null: false, foreign_key: true
  end
end
