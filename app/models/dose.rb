class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  add_index :cocktail_ingredients, [:cocktail_id, :ingredient_id], unique: true
end
