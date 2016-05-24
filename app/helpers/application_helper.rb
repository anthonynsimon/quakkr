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
    unless user.nil?
      if user.avatar.exists?(size)
        user.avatar.url(size)
      else
        "/images/sample_avatar_#{Random.new.rand(3)}.jpg"
      end
    end
  end
end