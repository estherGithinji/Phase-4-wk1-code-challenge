class Restaurantpizza < ApplicationRecord
  belongs_to :pizza
  belongs_to :restaurant

  validates :price, presence: true, length:{in: 1..30}
end
