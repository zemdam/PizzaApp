class AddNameToAdress < ActiveRecord::Migration[7.0]
  def change
    add_column :adresses, :name, :string, null: false
  end
end
