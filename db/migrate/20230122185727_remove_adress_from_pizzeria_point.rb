class RemoveAdressFromPizzeriaPoint < ActiveRecord::Migration[7.0]
  def change
    remove_reference :pizzeria_points, :adress, null: false, foreign_key: true
  end
end
