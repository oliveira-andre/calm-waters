class DashboardsController < ApplicationController
  def index
    @tanks = Tank.all
  end
end