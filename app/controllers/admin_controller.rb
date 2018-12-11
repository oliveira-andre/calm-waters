class AdminController < ApplicationController
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

  private

  def alarm_params
    params.require(:alarm).permit(:alarm_type_id, :active, :sound_effect, :message)
  end
end