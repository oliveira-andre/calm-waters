class DashboardsController < ApplicationController

  def index
    @tanks = Tank.all
    @biomassa = 0
    Specie.all.each do |specie|
      @biomassa += specie.weight
    end
  end

  def get_ambiental_condition_values
    ambiental_condition = AmbientalCondition.first
    render json: {ambiental_condition: ambiental_condition}
  end

  def get_tank_values
    tank = Tank.first
    render json: {tank: tank}
  end

  def get_difference_between_ambiental_condition_and_tank_values
    ambiental_condition = AmbientalCondition.first
    tank = Tank.first
    render json: {tank: tank, ambiental_condition: ambiental_condition}
  end
end