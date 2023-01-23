class IngredientsPrice < ApplicationRecord
    has_many :pizzeria_points, dependent: :destroy

    validates :name, :cheese_price, :ham_price, :sauce_price, :pineapple_price, presence: true
    validates :name, uniqueness: true

    def self.search(search)
        if search
            where('name LIKE ?', "%#{search}%")
        else
            all
        end
    end
end
