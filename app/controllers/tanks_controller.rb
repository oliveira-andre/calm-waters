class TanksController < ApplicationController
  before_action :set_tank, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:insert_diary_data]
  skip_before_action :verify_authenticity_token, only: [:insert_diary_data]

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
        flash[:success] = "Cadastrado com sucesso"
        format.html {redirect_to tanks_path}
        format.json {render :show, status: :created, location: @tank}
        MonitoringHistory.create(tank_id: @tank.id, monitoring_date: Time.now, ph: @tank.ph, oxigen: @tank.oxigen)
      else
        flash[:error] = "Verifique os campos"
        format.html {render :new}
        format.json {render json: @tank.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @tank.update(tank_params)
        flash[:success] = "Editado com sucesso"
        format.html {redirect_to tanks_path}
        format.json {render :show, status: :ok, location: @tank}
        MonitoringHistory.create(tank_id: @tank.id, monitoring_date: Time.now, ph: @tank.ph, oxigen: @tank.oxigen)
      else
        flash[:error] = "Verifique os campos"
        format.html {render :edit}
        format.json {render json: @tank.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @tank.destroy
        flash[:success] = "Excluído com sucesso"
        format.html {redirect_to tanks_path}
        format.json {head :no_content}
      else
        flash[:error] = "Pois está populado"
        format.html {redirect_to tanks_path}
      end
    end
  end

  def insert_diary_data
    tank = ActiveModelSerializers::TankSerializer.new(id: params[:id], acidity: params[:acidity], temperature: params[:temperature], oxigen: params[:oxigen], ammonia: params[:ammonia], ph: params[:ph], depopulation_date: params[:depopulation_date], final_quantity: [:final_quantity]).diary_data
    render 200, json: {cod: 200, status: "Created", tanque: tank} unless params[:id].nil? || params[:acidity].nil? || params[:temperature].nil? || params[:oxigen].nil? || params[:ammonia].nil? || params[:ph].nil?
    render 404, json: {cod: 404, status: "not found", mensagem: "Faltando parametros"} if params[:id].nil? || params[:acidity].nil? || params[:temperature].nil? || params[:oxigen].nil? || params[:ammonia].nil? || params[:ph].nil?
  end

  def find_date
    tanks = Tank.all
    tanks.each do |tank|
      date = Time.now.getlocal("+00:00").strftime("%d%m%Y").to_i - tank.updated_at.strftime("%d%m%Y").to_i
      if date != 0
        Notification.create(message: "Você está a um dia ou mais sem editar o tanque", type_message: "warning", tank_id: tank.id)  
      end
    end
  end    

  private

  def set_tank
    @tank = Tank.find(params[:id])
  end

  def tank_params
    params.require(:tank).permit(:id, :user_id, :specie_id, :population_date, :initial_quantity, :depopulation_date, :final_quantity, :tank_type, :temperature, :oxigen, :ph, :ammonia, :acidity)
  end
end
