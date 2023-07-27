class AddNameToPizzaType < ActiveRecord::Migration[7.0]
  def change
    add_column :pizza_types, :name, :string, null: false
    add_index :pizza_types, :name, unique: true
  end
end
