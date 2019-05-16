class DosesController < ApplicationController
  def create
    ingredients = Ingredient.where(id: [:ingredient_id])
    cocktail = Cocktail.find(params[:cocktail_id])
    ingredients.each do |ingredient|
      @dose = Dose.new(ingredient: ingredient, cocktail: cocktail)
      @dose.save
    end
  end

  def new
    @ingredient = Ingredient.all
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def destroy
    @dose = Dose.find(params[:id])
    cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(cocktail)
  end
  redirect_to cocktails_path(@cocktails)
end
