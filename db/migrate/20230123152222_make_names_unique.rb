class MakeNamesUnique < ActiveRecord::Migration[7.0]
  def change
    add_index :adresses, [:user_id, :name], unique: true
    remove_index :adresses, name: "index_adresses_on_street_name_and_street_number_and_city"

    add_index :pizza_sizes, :name, unique: true
    remove_index :pizza_sizes, name: "index_pizza_sizes_on_p_size"

    add_index :pizzeria_points, :name, unique: true

    add_index :storages, :name, unique: true
  end
end
