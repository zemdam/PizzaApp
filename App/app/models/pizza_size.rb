class PizzaSize < ApplicationRecord
    validates :p_size, :basic_price, :name, presence: true
    validates :name, uniqueness: true

    def self.search(search)
        if search
            where('name LIKE ?', "%#{search}%")
        else
            all
        end
    end
end
