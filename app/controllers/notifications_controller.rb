class NotificationsController < ApplicationController
  before_action :authenticate_user!, only: [:link_through]
  before_action :set_notification, only: [:link_through]
  before_action :authorize_read, only: [:link_through]

  def link_through
    @notification.update read: true
    redirect_to post_path(@notification.post)
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end

  def authorize_read
    redirect_to root_path if current_user != @notification.user
  end
end
