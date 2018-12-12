class FoodTypesController < ApplicationController
  before_action :set_food_type, only: [:show, :edit, :update, :destroy]
  before_action :redirect_perfil

  def index
    @food_types = FoodType.all
  end

  def show; end

  def new
    @food_type = FoodType.new
  end

  def edit; end

  def create
    @food_type = FoodType.new(food_type_params)

    respond_to do |format|
      if @food_type.save
        flash[:success] = "Cadastrado com sucesso"
        format.html {redirect_to food_types_path}
        format.json {render :show, status: :created, location: @food_type}
      else
        flash[:error] = "Verifique os campos"
        format.html {render :new}
        format.json {render json: @food_type.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @food_type.update(food_type_params)
        flash[:success] = "Editado com sucesso"
        format.html {redirect_to food_types_path}
        format.json {render :show, status: :ok, location: @food_type}
      else
        flash[:error] = "Verifique os campos"
        format.html {render :edit}
        format.json {render json: @food_type.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @food_type.destroy
        flash[:success] = "Excluído com suceeso"
        format.html {redirect_to food_types_path}
        format.json {head :no_content}
      else
        flash[:error] = "Está relacionado em outra tabela"
        format.html {redirect_to food_types_path}
      end
    end
  end

  private

  def redirect_perfil
    if user_signed_in?
      if current_user.perfil_id != 1
        redirect_to dashboards_path
        flash[:error] = "Você não pode acessar essa URL"
      end
    end
  end

  def set_food_type
    @food_type = FoodType.find(params[:id])
  end

  def food_type_params
    params.require(:food_type).permit(:description, :active)
  end

end
