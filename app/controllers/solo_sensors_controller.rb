class SoloSensorsController < ApplicationController
  before_action :set_solo_sensor, only: [:show, :edit, :update, :destroy]

  # GET /solo_sensors
  # GET /solo_sensors.json
  def index
    @solo_sensors = SoloSensor.all
  end

  # GET /solo_sensors/1
  # GET /solo_sensors/1.json
  def show
  end

  # GET /solo_sensors/new
  def new
    @solo_sensor = SoloSensor.new
  end

  # GET /solo_sensors/1/edit
  def edit
  end

  # POST /solo_sensors
  # POST /solo_sensors.json
  def create
    @solo_sensor = SoloSensor.new(solo_sensor_params)

    respond_to do |format|
      if @solo_sensor.save
        format.html { redirect_to @solo_sensor, notice: 'Solo sensor was successfully created.' }
        format.json { render :show, status: :created, location: @solo_sensor }
      else
        format.html { render :new }
        format.json { render json: @solo_sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solo_sensors/1
  # PATCH/PUT /solo_sensors/1.json
  def update
    respond_to do |format|
      if @solo_sensor.update(solo_sensor_params)
        format.html { redirect_to @solo_sensor, notice: 'Solo sensor was successfully updated.' }
        format.json { render :show, status: :ok, location: @solo_sensor }
      else
        format.html { render :edit }
        format.json { render json: @solo_sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solo_sensors/1
  # DELETE /solo_sensors/1.json
  def destroy
    @solo_sensor.destroy
    respond_to do |format|
      format.html { redirect_to solo_sensors_url, notice: 'Solo sensor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solo_sensor
      @solo_sensor = SoloSensor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solo_sensor_params
      params.require(:solo_sensor).permit(:tank_id, :calcium, :ph, :phosphoror, :carbon)
    end
end
