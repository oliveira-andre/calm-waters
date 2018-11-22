class AmbientalConditionsController < ApplicationController
  before_action :set_ambiental_condition, only: [:show, :edit, :update, :destroy]

  # GET /ambiental_conditions
  # GET /ambiental_conditions.json
  def index
    @ambiental_conditions = AmbientalCondition.all
  end

  # GET /ambiental_conditions/1
  # GET /ambiental_conditions/1.json
  def show
  end

  # GET /ambiental_conditions/new
  def new
    @ambiental_condition = AmbientalCondition.new
  end

  # GET /ambiental_conditions/1/edit
  def edit
  end

  # POST /ambiental_conditions
  # POST /ambiental_conditions.json
  def create
    @ambiental_condition = AmbientalCondition.new(ambiental_condition_params)

    respond_to do |format|
      if @ambiental_condition.save
        format.html { redirect_to @ambiental_condition, notice: 'Ambiental condition was successfully created.' }
        format.json { render :show, status: :created, location: @ambiental_condition }
      else
        format.html { render :new }
        format.json { render json: @ambiental_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ambiental_conditions/1
  # PATCH/PUT /ambiental_conditions/1.json
  def update
    respond_to do |format|
      if @ambiental_condition.update(ambiental_condition_params)
        format.html { redirect_to @ambiental_condition, notice: 'Ambiental condition was successfully updated.' }
        format.json { render :show, status: :ok, location: @ambiental_condition }
      else
        format.html { render :edit }
        format.json { render json: @ambiental_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ambiental_conditions/1
  # DELETE /ambiental_conditions/1.json
  def destroy
    @ambiental_condition.destroy
    respond_to do |format|
      format.html { redirect_to ambiental_conditions_url, notice: 'Ambiental condition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ambiental_condition
      @ambiental_condition = AmbientalCondition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ambiental_condition_params
      params.require(:ambiental_condition).permit(:ideal_temperature, :ideal_oxigen, :ideal_ph, :ideal_ammonia, :ideal_acidity)
    end
end
