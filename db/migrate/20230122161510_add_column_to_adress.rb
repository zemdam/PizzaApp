class AddColumnToAdress < ActiveRecord::Migration[7.0]
  def change
    add_reference :adresses, :client, null: false, foreign_key: true
  end
end
