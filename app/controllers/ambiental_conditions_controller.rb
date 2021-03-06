class AmbientalConditionsController < ApplicationController
  before_action :set_ambiental_condition, only: [:show, :edit, :update, :destroy]
  before_action :redirect_perfil
  skip_before_action :redirect_perfil, only: :calculate


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
    if AmbientalCondition.all.length != 0
      tanks = Tank.all
      tanks.each do |tank|
        ambiental_condition = AmbientalCondition.find_by(specie_id: Specie.find(tank.specie_id).id)
        ammonia = tank.ammonia - ambiental_condition.ideal_ammonia
        temperature = tank.temperature - ambiental_condition.ideal_temperature
        oxigen = tank.oxigen - ambiental_condition.ideal_oxigen
        ph = tank.ph - ambiental_condition.ideal_ph
        acidity = tank.acidity - ambiental_condition.ideal_acidity
        puts ammonia
        if Notification.where(viewed: false).length == 0
          if ammonia < 0
            puts "I'M HERE"
            Notification.create(message: "Amonia está menor do que o ideal no", type_message: "danger", tank_id: tank.id)
          end
          if ammonia > 0
            Notification.create(message: "Amonia está maior do que o ideal no", type_message: "danger", tank_id: tank.id)
          end

          if temperature < 0
            Notification.create(message: "Temperatura está menor do que o ideal no", type_message: "danger", tank_id: tank.id)
          end
          if temperature < 0
            Notification.create(message: "Temperatura está maior do que o ideal no", type_message: "danger", tank_id: tank.id)
          end

          if oxigen < 0
            Notification.create(message: "Oxigenio está menor do que o ideal no", type_message: "danger", tank_id: tank.id)
          end
          if oxigen < 0
            Notification.create(message: "Oxigenio está maior do que o ideal no", type_message: "danger", tank_id: tank.id)
          end

          if ph < 0
            Notification.create(message: "PH está menor do que o ideal no", type_message: "danger", tank_id: tank.id)
          end
          if ph < 0
            Notification.create(message: "PH está maior do que o ideal no", type_message: "danger", tank_id: tank.id)
          end

          if acidity < 0
            Notification.create(message: "Acidez está menor do que o ideal no", type_message: "danger", tank_id: tank.id)
          end
          if acidity < 0
            Notification.create(message: "Acidez está maior do que o ideal no", type_message: "danger", tank_id: tank.id)
          end
          if ammonia < 0
            Notification.create(message: "Amonia está menor do que o ideal no", type_message: "danger", tank_id: tank.id)
          end
          if ammonia > 0
            Notification.create(message: "Amonia está maior do que o ideal no", type_message: "danger", tank_id: tank.id)
          end

          if temperature < 0
            Notification.create(message: "Temperatura está menor do que o ideal no", type_message: "danger", tank_id: tank.id)
          end
          if temperature < 0
            Notification.create(message: "Temperatura está maior do que o ideal no", type_message: "danger", tank_id: tank.id)
          end

          if oxigen < 0
            Notification.create(message: "Oxigenio está menor do que o ideal no", type_message: "danger", tank_id: tank.id)
          end
          if oxigen < 0
            Notification.create(message: "Oxigenio está maior do que o ideal no", type_message: "danger", tank_id: tank.id)
          end

          if ph < 0
            Notification.create(message: "PH está menor do que o ideal no", type_message: "danger", tank_id: tank.id)
          end
          if ph < 0
            Notification.create(message: "PH está maior do que o ideal no", type_message: "danger", tank_id: tank.id)
          end

          if acidity < 0
            Notification.create(message: "Acidez está menor do que o ideal no", type_message: "danger", tank_id: tank.id)
          end
          if acidity < 0
            Notification.create(message: "Acidez está maior do que o ideal no", type_message: "danger", tank_id: tank.id)
          end

        else

          if ammonia < 0
            Notification.create(message: "Amonia está menor do que o ideal no", type_message: "danger", tank_id: tank.id) unless Notification.last.tank_id == tank.id && Notification.last.message == "Amonia está menor do que o ideal no"
          end

          if ammonia > 0
            Notification.create(message: "Amonia está maior do que o ideal no", type_message: "danger", tank_id: tank.id) unless Notification.last.tank_id == tank.id && Notification.last.message == "Amonia está maior do que o ideal no"
          end

          if temperature < 0
            Notification.create(message: "Temperatura está menor do que o ideal no", type_message: "danger", tank_id: tank.id) unless Notification.last.tank_id == tank.id && Notification.last.message == "Temperatura está menor do que o ideal no"
          end
          if temperature < 0
            Notification.create(message: "Temperatura está maior do que o ideal no", type_message: "danger", tank_id: tank.id) unless Notification.last.tank_id == tank.id && Notification.last.message == "Temperatura está maior do que o ideal no"
          end

          if oxigen < 0
            Notification.create(message: "Oxigenio está menor do que o ideal no", type_message: "danger", tank_id: tank.id) unless Notification.last.tank_id == tank.id && Notification.last.message == "Oxigenio está menor do que o ideal no"
          end
          if oxigen < 0
            Notification.create(message: "Oxigenio está maior do que o ideal no", type_message: "danger", tank_id: tank.id) unless Notification.last.tank_id == tank.id && Notification.last.message == "Oxigenio está maior do que o ideal no"
          end

          if ph < 0
            Notification.create(message: "PH está menor do que o ideal no", type_message: "danger", tank_id: tank.id) unless Notification.last.tank_id == tank.id && Notification.last.message == "PH está menor do que o ideal no"
          end
          if ph < 0
            Notification.create(message: "PH está maior do que o ideal no", type_message: "danger", tank_id: tank.id) unless Notification.last.tank_id == tank.id && Notification.last.message == "PH está maior do que o ideal no"
          end

          if acidity < 0
            Notification.create(message: "Acidez está menor do que o ideal no", type_message: "danger", tank_id: tank.id) unless Notification.last.tank_id == tank.id && Notification.last.message == "Acidez está menor do que o ideal no"
          end
          if acidity < 0
            Notification.create(message: "Acidez está maior do que o ideal no", type_message: "danger", tank_id: tank.id) unless Notification.last.tank_id == tank.id && Notification.last.message == "Acidez está maior do que o ideal no"
          end
        end
      end
    end
  end

  private

  def redirect_perfil
    if user_signed_in?
      if current_user.perfil_id != 1
        redirect_to dashboards_path
        flash[:error] = "Você não pode acessar essa URL"
      end
    end
  end

  def set_ambiental_condition
    @ambiental_condition = AmbientalCondition.find(params[:id])
  end

  def ambiental_condition_params
    params.require(:ambiental_condition).permit(:ideal_temperature, :ideal_oxigen, :ideal_ph, :ideal_ammonia, :ideal_acidity, :specie_id)
  end
end
