class NameInPizzaSizeNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column :pizza_sizes, :name, :string, null: false
  end
end
