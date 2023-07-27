class PizzeriaPoint < ApplicationRecord
  belongs_to :ingredients_price
  has_many :storages

  validates :name, :ingredients_price, presence: true
  validates :name, uniqueness: true

  def self.search(search)
    if search
        where('name LIKE ?', "%#{search}%")
    else
        all
    end
  end
end
