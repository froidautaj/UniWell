# frozen_string_literal: true

class NotificationsController < AuthController
  load_and_authorize_resource

  before_action :set_notification, only: %i[mark_as_read]

  def index
    @notifications = current_user.notifications.order(created_at: :desc).page(params[:page]).per(10)
    @noticiations_count = current_user.notifications.count
  end

  def mark_as_read
    @notification.update!(read: true)

    redirect_to @notification.link
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy

    redirect_to notifications_path
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end
end
