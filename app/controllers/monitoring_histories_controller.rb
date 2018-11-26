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
        flash[:success] = "Cadastrado com sucesso"
        format.html {redirect_to monitoring_histories_path}
        format.json {render :show, status: :created, location: @monitoring_history}
      else
        flash[:error] = "Verifique os campos"
        format.html {render :new}
        format.json {render json: @monitoring_history.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @monitoring_history.update(monitoring_history_params)
        flash[:success] = "Editado com sucesso"
        format.html {redirect_to monitoring_histories_path}
        format.json {render :show, status: :ok, location: @monitoring_history}
      else
        flash[:error] = "Verifique os campos"
        format.html {render :edit}
        format.json {render json: @monitoring_history.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @monitoring_history.destroy
        flash[:success] = "Excluído com sucesso"
        format.html {redirect_to monitoring_histories_path}
        format.json {head :no_content}
      else
        flash[:error] = "Está relacionado em outra tabela"
        format.html {redirect_to monitoring_histories_path}
        format.json {head :no_content}
      end
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
