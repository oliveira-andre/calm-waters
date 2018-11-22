class FoodSpeciesController < ApplicationController
  before_action :set_food_specy, only: [:show, :edit, :update, :destroy]

  # GET /food_species
  # GET /food_species.json
  def index
    @food_species = FoodSpecie.all
  end

  # GET /food_species/1
  # GET /food_species/1.json
  def show
  end

  # GET /food_species/new
  def new
    @food_specy = FoodSpecie.new
  end

  # GET /food_species/1/edit
  def edit
  end

  # POST /food_species
  # POST /food_species.json
  def create
    @food_specy = FoodSpecie.new(food_specy_params)

    respond_to do |format|
      if @food_specy.save
        format.html { redirect_to @food_specy, notice: 'Food specie was successfully created.' }
        format.json { render :show, status: :created, location: @food_specy }
      else
        format.html { render :new }
        format.json { render json: @food_specy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_species/1
  # PATCH/PUT /food_species/1.json
  def update
    respond_to do |format|
      if @food_specy.update(food_specy_params)
        format.html { redirect_to @food_specy, notice: 'Food specie was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_specy }
      else
        format.html { render :edit }
        format.json { render json: @food_specy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_species/1
  # DELETE /food_species/1.json
  def destroy
    @food_specy.destroy
    respond_to do |format|
      format.html { redirect_to food_species_url, notice: 'Food specie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_specy
      @food_specy = FoodSpecie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_specy_params
      params.require(:food_specy).permit(:food_id, :food_quantity)
    end
end
