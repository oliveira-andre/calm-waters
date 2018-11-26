class SpeciesController < ApplicationController
  before_action :set_species, only: [:show, :edit, :update, :destroy]

  def index
    @species = Specie.all
  end

  def new
    @specie = Specie.new
  end

  def show; end

  def edit; end

  def create
    @specie = Specie.new(species_params)

    respond_to do |format|
      if @specie.save
        format.html {redirect_to species_path}
        format.json {render :show, status: :created, location: @species}
      else
        format.html {render :new}
        format.json {render json: @species.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @specie.update(species_params)
        format.html {redirect_to species_path}
        format.json {render :show, status: :ok, location: @species}
      else
        format.html {render :edit}
        format.json {render json: @species.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @specie.destroy
    respond_to do |format|
      format.html {redirect_to species_path}
      format.json {head :no_content}
    end
  end

  private

  def set_species
    @specie = Specie.find(params[:id])
  end

  def species_params
    params.require(:specie).permit(:price, :weight, :food_specie_id, :ambiental_condition_id, :specie_name, :observation)
  end
end
