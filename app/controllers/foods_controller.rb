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
        flash[:success] = "Cadastrado com sucesso"
        format.html {redirect_to foods_path}
        format.json {render :show, status: :created, location: @food}
      else
        flash[:error] = "Verifique os campos"
        format.html {render :new}
        format.json {render json: @food.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @food.update(food_params)
        flash[:success] = "Editado com sucesso"
        format.html {redirect_to foods_path}
        format.json {render :show, status: :ok, location: @food}
      else
        flash[:error] = "Verifique os campos"
        format.html {render :edit}
        format.json {render json: @food.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @food.destroy
        flash[:success] = "Excuído com sucesso"
        format.html {redirect_to foods_path}
        format.json {head :no_content}
      else
        flash[:error] = "Está relacionado em outra tabela"
        format.html {redirect_to foods_path}
        format.json {head :no_content}
      end
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
