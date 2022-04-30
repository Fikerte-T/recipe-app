class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.includes(:recipe_foods).find(params[:id])
    # @recipe = current_user.recipes.includes(:recipe_foods).find(params[:id])
    
    @recipe_foods = @recipe.recipe_foods.includes(:food)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public))
    if @recipe.save
      flash.notice = 'Recipe was successfully created.'
      redirect_to user_recipes_path(@recipe.user)
    else
      flash.alert = 'Recipe was not created.'
      render :new
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(public: params[:public])
      flash[:success] = 'public status successfully updated'
    else
      flash[:error] = 'Error: could not update public status'
    end
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy!
    flash[:success] = 'Recipe deleted!'
    redirect_to recipes_path, notice: 'Recipe successfully deleted'
  end
end
