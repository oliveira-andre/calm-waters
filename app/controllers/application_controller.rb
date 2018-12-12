class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :notifications
  before_action :redirect_perfil

  def notifications
    @notifications = Notification.where("viewed = ?", false)
  end

  def redirect_perfil
    if user_signed_in?
      if current_user.perfil_id != 1
        redirect_to dashboards_path
        flash[:error] = "Você não pode acessar essa URL"
      end
    end
  end
end
