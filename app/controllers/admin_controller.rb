class AdminController < ApplicationController
  before_action :redirect_perfil
  skip_before_action :redirect_perfil, only: :catch_alarm


  def index
    @alarms = Alarm.all
  end

  def new
    @alarm = Alarm.new
  end

  def create
    @alarm = Alarm.new(alarm_params)

    respond_to do |format|
      if @alarm.save
        format.html {redirect_to alarms_path}
        format.json {render :show, status: :created, location: @alarm}
      else
        format.html {render :new}
        format.json {render json: @alarm.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
    @alarm = Alarm.find(params[:id])
  end

  def catch_alarm
    alarm = Alarm.where(active: true)
    render json: {alarm: alarm.last, alarm_type: alarm.last.alarm_type.description} unless alarm.blank?
    render json: {alarm: 0} if alarm.blank?
  end

  private

  def alarm_params
    params.require(:alarm).permit(:alarm_type_id, :active, :sound_effect, :message)
  end

  def redirect_perfil
    if current_user.perfil_id != 1
      redirect_to dashboards_path
      flash[:error] = "Você não pode acessar essa URL"
    end
  end

end