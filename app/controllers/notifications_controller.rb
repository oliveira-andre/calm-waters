class NotificationsController < ApplicationController
  before_action :set_notification
  def update_view
    @notification.update(viewed: true)
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end

  def notification_params
    params.permit(:id)
  end
end