class FixSizeNameInPizzaSize < ActiveRecord::Migration[7.0]
  def change
    rename_column :pizza_sizes, :size, :p_size
  end
end
