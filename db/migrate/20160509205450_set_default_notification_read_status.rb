class SetDefaultNotificationReadStatus < ActiveRecord::Migration
  def change
    change_column_default :notifications, :read, false
  end
end
