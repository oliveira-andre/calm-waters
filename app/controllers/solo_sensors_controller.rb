class SoloSensorsController < ApplicationController
  before_action :set_solo_sensor, only: [:show, :edit, :update, :destroy]

  def index
    @solo_sensors = SoloSensor.all
  end

  def show; end

  def new
    @solo_sensor = SoloSensor.new
  end

  def edit; end

  def create
    @solo_sensor = SoloSensor.new(solo_sensor_params)

    respond_to do |format|
      if @solo_sensor.save
        flash[:success] = "Cadastrado com sucesso"
        format.html {redirect_to solo_sensors_path}
        format.json {render :show, status: :created, location: @solo_sensor}
      else
        flash[:error] = "Verifique os campos"
        format.html {render :new}
        format.json {render json: @solo_sensor.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @solo_sensor.update(solo_sensor_params)
        flash[:success] = "Editado com sucesso"
        format.html {redirect_to solo_sensors_path}
        format.json {render :show, status: :ok, location: @solo_sensor}
      else
        flash[:error] = "Verifique os campos"
        format.html {render :edit}
        format.json {render json: @solo_sensor.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @solo_sensor.destroy
        flash[:success] = "Excluído com sucesso"
        format.html {redirect_to solo_sensors_path}
        format.json {head :no_content}
      else
        flash[:error] = "Está relacionado em outra tabela"
        format.html {redirect_to solo_sensors_path}
        format.json {head :no_content}
      end
    end
  end

  private

  def set_solo_sensor
    @solo_sensor = SoloSensor.find(params[:id])
  end

  def solo_sensor_params
    params.require(:solo_sensor).permit(:tank_id, :calcium, :ph, :phosphoror, :carbon)
  end
end
