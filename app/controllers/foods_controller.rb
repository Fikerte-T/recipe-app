class FoodsController < ApplicationController
  def index
     @foods = Food.all
    #  if @foods.empty?
    #     @foods = 'No food to display'
    #  else
    #     @foods
    #  end
  end

  def new
  end

  def create
    # render plain: params[:food].inspect
    @food = Food.new(params.require(:food).permit(:name, :measurement_unit, :price))
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
end
