class FoodSpeciesController < ApplicationController
  before_action :set_food_specy, only: [:show, :edit, :update, :destroy]

  def index
    @food_species = FoodSpecie.all
  end

  def show; end

  def new
    @food_specy = FoodSpecie.new
  end

  def edit; end

  def create
    @food_specy = FoodSpecie.new(food_specy_params)

    respond_to do |format|
      if @food_specy.save
        flash[:success] = "Cadastrado com sucesso"
        format.html {redirect_to food_species_path}
        format.json {render :show, status: :created, location: @food_specy}
      else
        flash[:error] = "Verifique os campos"
        format.html {render :new}
        format.json {render json: @food_specy.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @food_specy.update(food_specy_params)
        flash[:success] = "Editado com sucesso"
        format.html {redirect_to food_species_path}
        format.json {render :show, status: :ok, location: @food_specy}
      else
        flash[:error] = "Verifique os campos"
        format.html {render :edit}
        format.json {render json: @food_specy.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @food_specy.destroy
        flash[:success] = "Excluído com sucesso"
        format.html {redirect_to food_species_path}
        format.json {head :no_content}
      else
        flash[:error] = "Está relacionado em outra tabela"
        format.html {redirect_to food_species_path}
        format.json {head :no_content}
      end
    end
  end

  private

  def set_food_specy
    @food_specy = FoodSpecie.find(params[:id])
  end

  def food_specy_params
    params.require(:food_specie).permit(:food_id, :food_quantity)
  end
end
