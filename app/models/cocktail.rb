class Cocktail < ApplicationRecord
  has_many :ingredients, through: :doses
  validates :name, uniqueness: true, allow_blank: false
end
