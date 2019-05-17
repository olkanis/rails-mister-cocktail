# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient = open(url).read
user = JSON.parse(ingredient)

user['drinks'].each do |drink|
  ingredient = Ingredient.create!(name: drink['strIngredient1'])
  ingredient.save
  # cocktail = Cocktail.create!(name: Faker::Beer.name)
  # Dose.create!(
  # description: ['1cl', '2cl', '3cl'].sample,
  # ingredient: ingredient, cocktail: cocktail
end
