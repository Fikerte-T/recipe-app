class GeneralShoppingListController < ApplicationController
  def index
    @recipes = current_user.recipes

    total_items(@recipes)
    total_value(@recipes)
  end

  def total_items(recipes)
    @total_food = 0
    recipes.map do |r|
      0 unless r.foods.any?
      @total_food += r.foods.distinct.count(:id)
    end
    @total_food
  end

  def total_value(recipes)
    @total_value = 0
    recipes.each do |r|
      r.recipe_foods.each do |recipe_food|
        @total_value += recipe_food.food.price * recipe_food.quantity
      end
    end
    @total_value
  end
end
