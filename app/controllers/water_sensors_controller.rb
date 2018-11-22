class WaterSensorsController < ApplicationController
  before_action :set_water_sensor, only: [:show, :edit, :update, :destroy]

  # GET /water_sensors
  # GET /water_sensors.json
  def index
    @water_sensors = WaterSensor.all
  end

  # GET /water_sensors/1
  # GET /water_sensors/1.json
  def show
  end

  # GET /water_sensors/new
  def new
    @water_sensor = WaterSensor.new
  end

  # GET /water_sensors/1/edit
  def edit
  end

  # POST /water_sensors
  # POST /water_sensors.json
  def create
    @water_sensor = WaterSensor.new(water_sensor_params)

    respond_to do |format|
      if @water_sensor.save
        format.html { redirect_to @water_sensor, notice: 'Water sensor was successfully created.' }
        format.json { render :show, status: :created, location: @water_sensor }
      else
        format.html { render :new }
        format.json { render json: @water_sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /water_sensors/1
  # PATCH/PUT /water_sensors/1.json
  def update
    respond_to do |format|
      if @water_sensor.update(water_sensor_params)
        format.html { redirect_to @water_sensor, notice: 'Water sensor was successfully updated.' }
        format.json { render :show, status: :ok, location: @water_sensor }
      else
        format.html { render :edit }
        format.json { render json: @water_sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /water_sensors/1
  # DELETE /water_sensors/1.json
  def destroy
    @water_sensor.destroy
    respond_to do |format|
      format.html { redirect_to water_sensors_url, notice: 'Water sensor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_water_sensor
      @water_sensor = WaterSensor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def water_sensor_params
      params.require(:water_sensor).permit(:tank_id, :calcium, :ph, :phosphoror, :hydrogen, :oxigen, :acidity)
    end
end
