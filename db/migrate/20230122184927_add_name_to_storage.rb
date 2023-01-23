class AddNameToStorage < ActiveRecord::Migration[7.0]
  def change
    add_column :storages, :name, :string, null: false
  end
end
