class PizzaType < ApplicationRecord
    validates :name, :required_cheese, :required_sauce, :required_ham, :required_pineapple, presence: true
    validates :name, uniqueness: true

    def self.search(search)
        if search
            where('name LIKE ?', "%#{search}%")
        else
            all
        end
    end
end
