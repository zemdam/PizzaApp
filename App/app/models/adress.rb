class Adress < ApplicationRecord
    belongs_to :user
    has_many :pizza_orders, dependent: :destroy

    validates :street_number, :city, :name, presence: true
    validates :name, uniqueness: { scope: :user_id }, on: :create

    def self.search(search)
        if search
            where('name LIKE ?', "%#{search}%")
        else
            all
        end
    end
end
