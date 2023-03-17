class Pizza < ApplicationRecord
    has_many :restaurantpizzas
    has_many :restaurants, through: :restaurantpizzas

    validates :name, presence: true
    validates :ingredients, presence: true
end
