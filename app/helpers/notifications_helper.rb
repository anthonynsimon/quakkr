module NotificationsHelper
  def unread_notifications
    current_user.notifications.where(read: false)
  end
end
