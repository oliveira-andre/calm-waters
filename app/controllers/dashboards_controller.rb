class DashboardsController < ApplicationController
  def index
    @tanks = Tank.all
    @biomassa = 0
    Specie.all.each do |specie|
      @biomassa += specie.weight
    end
  end
end