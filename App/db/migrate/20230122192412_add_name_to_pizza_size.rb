class AddNameToPizzaSize < ActiveRecord::Migration[7.0]
  def change
    rename_column :pizza_sizes, :p_size, :size
  end
end
