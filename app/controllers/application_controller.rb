class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :notifications

  def notifications
    @notifications = Notification.where("viewed = ?", false)
  end
end
