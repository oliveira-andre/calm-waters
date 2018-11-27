class AmbientalConditionsController < ApplicationController
  before_action :set_ambiental_condition, only: [:show, :edit, :update, :destroy]

  def index
    @ambiental_conditions = AmbientalCondition.all
  end

  def show; end

  def new
    @ambiental_condition = AmbientalCondition.new
  end

  def edit; end

  def create
    @ambiental_condition = AmbientalCondition.new(ambiental_condition_params)

    respond_to do |format|
      if @ambiental_condition.save
        flash[:success] = "Cadastrado com sucesso"
        format.html {redirect_to ambiental_conditions_path}
        format.json {render :show, status: :created, location: @ambiental_condition}
      else
        flash[:error] = "Verifique os campos"
        format.html {render :new}
        format.json {render json: @ambiental_condition.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @ambiental_condition.update(ambiental_condition_params)
        flash[:success] = "Editado com sucesso"
        format.html {redirect_to ambiental_conditions_path}
        format.json {render :show, status: :ok, location: @ambiental_condition}
      else
        flash[:error] = "Verifique os campos"
        format.html {render :edit}
        format.json {render json: @ambiental_condition.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    respond_to do |format|

      if @ambiental_condition.destroy
        flash[:success] = "Excluído com sucesso"
        format.html {redirect_to ambiental_conditions_path}
        format.json {head :no_content}
      else
        flash[:error] = "Está relacionado em outra tabela"
        format.html {redirect_to ambiental_conditions_path}
        format.json {head :no_content}
      end
    end
  end

  def calculate
    tanks = Tank.all
    tanks.each do |tank|
      ambiental_condition = AmbientalCondition.find(Specie.find(tank.specie).ambiental_condition)
      ammonia = tank.ammonia - ambiental_condition.ideal_ammonia
      temperature = tank.temperature - ambiental_condition.ideal_temperature
      oxigen = tank.oxigen - ambiental_condition.ideal_oxigen
      ph = tank.ph - ambiental_condition.ideal_ph
      acidity = tank.acidity - ambiental_condition.ideal_acidity
      render json: {ammonia: ammonia, temperature: temperature, oxigen: oxigen, ph: ph, acidity: acidity, tank: tank.id}
    end
  end

  private

  def set_ambiental_condition
    @ambiental_condition = AmbientalCondition.find(params[:id])
  end

  def ambiental_condition_params
    params.require(:ambiental_condition).permit(:ideal_temperature, :ideal_oxigen, :ideal_ph, :ideal_ammonia, :ideal_acidity)
  end
end
