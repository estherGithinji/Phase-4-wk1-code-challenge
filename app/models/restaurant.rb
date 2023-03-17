class Restaurant < ApplicationRecord
    has_many :restaurantpizzas
    has_many :pizzas, through: :restaurantpizzas

    validates :name, presence: true
    validates :address, presence: true
end
