class Storage < ApplicationRecord
  belongs_to :pizzeria_point

  validates :name, :available_cheese, :available_ham, :available_sauce, :available_pineapple, :pizzeria_point, presence: true
  validates :name, uniqueness: { scope: :pizzeria_point }, on: :create

  def diffrent_name?
    puts name
    puts "TUUUTTTTAAAAAAJJJJJJJJJ"
    name != "Normall Storage 1"
  end

  def self.search(search)
    if search
        where('name LIKE ?', "%#{search}%")
    else
        all
    end
  end
end
