class CreatePizzaTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :pizza_types do |t|
      t.string :required_cheese, null:false
      t.string :integer, null:false
      t.integer :required_sauce, null:false
      t.integer :required_ham, null:false
      t.integer :required_pineapple, null:false

      t.timestamps
    end
    add_index :pizza_types, [:required_cheese, :required_sauce, :required_ham, :required_pineapple], unique: true
  end
end
