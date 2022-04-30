class FoodsController < ApplicationController
  def index
    @user = current_user
    @foods = Food.where(user_id: current_user.id)
  end

  def new; end

  def create
    @food = current_user.foods.new(params.require(:food).permit(:name, :measurement_unit, :price))
    respond_to do |format|
      format.html do
        if @food.save
          redirect_to user_foods_path, notice: 'Food created successfully'
        else
          flash.now[:error] = 'Error: food could not be saved'
          render :new, locals: { food: @food }
        end
      end
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to user_foods_path(current_user.id), notice: 'Food successfully deleted'
  end
end
