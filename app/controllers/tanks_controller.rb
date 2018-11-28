class TanksController < ApplicationController
  before_action :set_tank, only: [:show, :edit, :update, :destroy]

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
        flash[:error] = "Está relacionado em outra tabela"
        format.html {redirect_to tanks_path}
        format.json {head :no_content}
      end
    end
  end

  def find_date
    tanks = Tank.all
    tanks.each do |tank|
      date = Time.now.getlocal('+00:00').strftime('%d%m%Y').to_i - tank.updated_at.strftime('%d%m%Y').to_i
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
    params.require(:tank).permit(:user_id, :specie_id, :population_date, :initial_quantity, :depopulation_date, :final_quantity, :tank_type, :temperature, :oxigen, :ph, :ammonia, :acidity)
  end
end
