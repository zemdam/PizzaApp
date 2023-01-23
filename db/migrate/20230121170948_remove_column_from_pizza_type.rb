class RemoveColumnFromPizzaType < ActiveRecord::Migration[7.0]
  def change
    remove_column :pizza_types, :integer, :string
  end
end
