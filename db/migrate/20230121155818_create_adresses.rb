class CreateAdresses < ActiveRecord::Migration[7.0]
  def change
    create_table :adresses do |t|
      t.string :street_name
      t.integer :street_number, null: false
      t.string :city, null: false

      t.timestamps
    end
    add_index :adresses, [:street_name, :street_number, :city], unique: true
  end
end
