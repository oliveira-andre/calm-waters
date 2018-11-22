class MonitoringHistoriesController < ApplicationController
  before_action :set_monitoring_history, only: [:show, :edit, :update, :destroy]

  # GET /monitoring_histories
  # GET /monitoring_histories.json
  def index
    @monitoring_histories = MonitoringHistory.all
  end

  # GET /monitoring_histories/1
  # GET /monitoring_histories/1.json
  def show
  end

  # GET /monitoring_histories/new
  def new
    @monitoring_history = MonitoringHistory.new
  end

  # GET /monitoring_histories/1/edit
  def edit
  end

  # POST /monitoring_histories
  # POST /monitoring_histories.json
  def create
    @monitoring_history = MonitoringHistory.new(monitoring_history_params)

    respond_to do |format|
      if @monitoring_history.save
        format.html { redirect_to @monitoring_history, notice: 'Monitoring history was successfully created.' }
        format.json { render :show, status: :created, location: @monitoring_history }
      else
        format.html { render :new }
        format.json { render json: @monitoring_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monitoring_histories/1
  # PATCH/PUT /monitoring_histories/1.json
  def update
    respond_to do |format|
      if @monitoring_history.update(monitoring_history_params)
        format.html { redirect_to @monitoring_history, notice: 'Monitoring history was successfully updated.' }
        format.json { render :show, status: :ok, location: @monitoring_history }
      else
        format.html { render :edit }
        format.json { render json: @monitoring_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monitoring_histories/1
  # DELETE /monitoring_histories/1.json
  def destroy
    @monitoring_history.destroy
    respond_to do |format|
      format.html { redirect_to monitoring_histories_url, notice: 'Monitoring history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monitoring_history
      @monitoring_history = MonitoringHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monitoring_history_params
      params.require(:monitoring_history).permit(:tank_id, :monitoring_date, :ph, :oxigen, :liming, :quantity_fetilizing, :quantitiy_food_daily, :disease, :procedimentos)
    end
end
