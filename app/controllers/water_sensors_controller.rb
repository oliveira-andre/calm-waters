class WaterSensorsController < ApplicationController
  before_action :set_water_sensor, only: [:show, :edit, :update, :destroy]
  before_action :redirect_perfil

  def index
    @water_sensors = WaterSensor.all
  end

  def show;
  end

  def new
    @water_sensor = WaterSensor.new
  end

  def edit;
  end

  def create
    @water_sensor = WaterSensor.new(water_sensor_params)

    respond_to do |format|
      if @water_sensor.save
        format.html {redirect_to water_sensors_path}
        format.json {render :show, status: :created, location: @water_sensor}
      else
        format.html {render :new}
        format.json {render json: @water_sensor.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @water_sensor.update(water_sensor_params)
        format.html {redirect_to water_sensors_path}
        format.json {render :show, status: :ok, location: @water_sensor}
      else
        format.html {render :edit}
        format.json {render json: @water_sensor.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @water_sensor.destroy
        flash[:success] = "Excluído com sucesso"
        format.html {redirect_to water_sensors_path}
        format.json {head :no_content}
      else
        flash[:error] = "Está relacionado em outra tabela"
        format.html {redirect_to water_sensors_path}
        format.json {head :no_content}
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

  def set_water_sensor
    @water_sensor = WaterSensor.find(params[:id])
  end

  def water_sensor_params
    params.require(:water_sensor).permit(:tank_id, :calcium, :ph, :phosphoror, :hydrogen, :oxigen, :acidity)
  end
end
