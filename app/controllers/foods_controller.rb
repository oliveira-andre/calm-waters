class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  def index
    @foods = Food.all
  end

  def show; end

  def new
    @food = Food.new
  end

  def edit; end

  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.html {redirect_to foods_path}
        format.json {render :show, status: :created, location: @food}
      else
        format.html {render :new}
        format.json {render json: @food.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html {redirect_to foods_path}
        format.json {render :show, status: :ok, location: @food}
      else
        format.html {render :edit}
        format.json {render json: @food.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @food.destroy
    respond_to do |format|
      format.html {redirect_to foods_path}
      format.json {head :no_content}
    end
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:food_type_id, :name, :composition, :observation)
  end
end
