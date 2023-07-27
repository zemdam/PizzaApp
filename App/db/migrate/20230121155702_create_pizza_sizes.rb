class CreatePizzaSizes < ActiveRecord::Migration[7.0]
  def change
    create_table :pizza_sizes do |t|
      t.integer :p_size, null: false
      t.integer :basic_price, null: false
      t.string :name, null: false

      t.timestamps
    end
    add_index :pizza_sizes, :p_size, unique: true
  end
end
