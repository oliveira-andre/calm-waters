class MonitoringHistoriesController < ApplicationController
  before_action :set_monitoring_history, only: [:show, :edit, :update, :destroy]

  def index
    @monitoring_histories = MonitoringHistory.all
  end

  def show; end

  def new
    @monitoring_history = MonitoringHistory.new
  end

  def edit; end

  def create
    @monitoring_history = MonitoringHistory.new(monitoring_history_params)

    respond_to do |format|
      if @monitoring_history.save
        format.html {redirect_to monitoring_histories_path}
        format.json {render :show, status: :created, location: @monitoring_history}
      else
        format.html {render :new}
        format.json {render json: @monitoring_history.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @monitoring_history.update(monitoring_history_params)
        format.html {redirect_to monitoring_histories_path}
        format.json {render :show, status: :ok, location: @monitoring_history}
      else
        format.html {render :edit}
        format.json {render json: @monitoring_history.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @monitoring_history.destroy
    respond_to do |format|
      format.html {redirect_to monitoring_histories_path}
      format.json {head :no_content}
    end
  end

  private

  def set_monitoring_history
    @monitoring_history = MonitoringHistory.find(params[:id])
  end

  def monitoring_history_params
    params.require(:monitoring_history).permit(:tank_id, :monitoring_date, :ph, :oxigen, :liming, :quantity_fetilizing, :quantitiy_food_daily, :disease, :procedimentos)
  end
end
