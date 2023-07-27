class PizzaOrder < ApplicationRecord
  belongs_to :pizza_type
  belongs_to :pizza_size
  belongs_to :adress
  belongs_to :pizzeria_point
  has_many :storages, through: :pizzeria_point

  validates :ingredients_multiplayer, :pizza_type, :pizza_size, :adress, :pizzeria_point, presence: true

  before_save do |order|
    price = 0
    type = order.pizza_type
    prices = order.pizzeria_point.ingredients_price
    multiplayer = order.ingredients_multiplayer

    price += order.pizza_size.basic_price
    price += multiplayer * (type.required_cheese * prices.cheese_price)
    price += multiplayer * (type.required_ham * prices.ham_price)
    price += multiplayer * (type.required_sauce * prices.sauce_price)
    price += multiplayer * (type.required_pineapple * prices.pineapple_price)

    order.total_price = price
  end

  def self.search(search)
    if search && !search.empty?
      where(id: search)
    else
      all
    end
  end
end
