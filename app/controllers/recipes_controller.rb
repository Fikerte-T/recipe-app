class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.includes(:recipe_foods).find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description))
    if @recipe.save
      flash.notice = 'Recipe was successfully created.'
      redirect_to user_recipes_path(@recipe.user)
    else
      flash.alert = 'Recipe was not created.'
      render :new
    end
  end
end
