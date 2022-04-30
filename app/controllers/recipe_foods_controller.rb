class RecipeFoodsController < ApplicationController
  def new
    @foods = current_user.foods
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new(params.require(:recipe_food).permit(:food_id, :quantity))
    respond_to do |format|
      format.html do
        if @recipe_food.save
          redirect_to [@recipe.user, @recipe], notice: 'Food added successfully'
        else
          flash.now[:error] = 'Error:  Food could not be added'
          render :new, locals: { recipe_food: @recipe_food }
        end
      end
    end
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(update_params)
      flash[:success] = 'Ingredient updated successfully.'
    else
      flash[:error] = 'Eroor: ingredient could not be updated'
    end
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    flash[:success] = 'ingredient deleted successfully.'
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  private

  def update_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
