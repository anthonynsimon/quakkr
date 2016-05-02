module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      "success" => "alert-success",
      "error" => "alert-danger",
      "alert" => "alert-warning",
      "notice" => "alert-info"
    }[flash_type] || flash_type.to_s
  end
  
  def get_user_avatar_url_for(user, size)
    if user.avatar.exists?(size)
      user.avatar.url(size)
    else
      '/images/missing_avatar.png'
    end
  end
end