class DosesController < ApplicationController
  def new
    @ingredient = Ingredient.all
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    # @dose.cocktail = @cocktail
    @dose = Dose.new(doses_params)
    if @dose.save
      redirect_to cocktails_path(@cocktails)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
