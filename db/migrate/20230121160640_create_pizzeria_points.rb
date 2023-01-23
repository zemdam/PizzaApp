class CreatePizzeriaPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :pizzeria_points do |t|
      t.string :name, null: false
      t.references :adress, index: {:unique=>true}, null: false, foreign_key: true
      t.references :ingredients_price, null: false, foreign_key: true

      t.timestamps
    end
  end
end
