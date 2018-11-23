class AmbientalConditionsController < ApplicationController
  before_action :set_ambiental_condition, only: [:show, :edit, :update, :destroy]

  def index
    @ambiental_conditions = AmbientalCondition.all
  end

  def show; end

  def new
    @ambiental_condition = AmbientalCondition.new
  end

  def edit; end

  def create
    @ambiental_condition = AmbientalCondition.new(ambiental_condition_params)

    respond_to do |format|
      if @ambiental_condition.save
        format.html {redirect_to ambiental_conditions_path}
        format.json {render :show, status: :created, location: @ambiental_condition}
      else
        format.html {render :new}
        format.json {render json: @ambiental_condition.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @ambiental_condition.update(ambiental_condition_params)
        format.html {redirect_to ambiental_conditions_path}
        format.json {render :show, status: :ok, location: @ambiental_condition}
      else
        format.html {render :edit}
        format.json {render json: @ambiental_condition.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @ambiental_condition.destroy
    respond_to do |format|
      format.html {redirect_to ambiental_conditions_path}
      format.json {head :no_content}
    end
  end

  private

  def set_ambiental_condition
    @ambiental_condition = AmbientalCondition.find(params[:id])
  end

  def ambiental_condition_params
    params.require(:ambiental_condition).permit(:ideal_temperature, :ideal_oxigen, :ideal_ph, :ideal_ammonia, :ideal_acidity)
  end
end
