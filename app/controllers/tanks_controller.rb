class TanksController < ApplicationController
  before_action :set_tank, only: [:show, :edit, :update, :destroy]

  def index
    @tanks = Tank.all
  end

  def show; end

  def new
    @tank = Tank.new
  end

  def edit; end

  def create
    @tank = Tank.new(tank_params)

    respond_to do |format|
      if @tank.save
        format.html {redirect_to tanks_path}
        format.json {render :show, status: :created, location: @tank}
      else
        format.html {render :new}
        format.json {render json: @tank.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @tank.update(tank_params)
        format.html {redirect_to tanks_path}
        format.json {render :show, status: :ok, location: @tank}
      else
        format.html {render :edit}
        format.json {render json: @tank.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @tank.destroy
    respond_to do |format|
      format.html {redirect_to tanks_path}
      format.json {head :no_content}
    end
  end

  private

  def set_tank
    @tank = Tank.find(params[:id])
  end

  def tank_params
    params.require(:tank).permit(:user_id, :specie_id, :population_date, :initial_quantity, :depopulation_date, :final_quantity, :tank_type)
  end
end
