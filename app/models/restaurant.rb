class Restaurant < ApplicationRecord
    has_many :pizzas, through: :restaurantpizza
end
