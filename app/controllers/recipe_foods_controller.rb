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
end
