class ChangeRequiredCheeseTypeInPizzaTypes < ActiveRecord::Migration[7.0]
  def change
    change_column :pizza_types, :required_cheese, :integer
  end
end
