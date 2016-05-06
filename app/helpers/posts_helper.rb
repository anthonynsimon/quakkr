module PostsHelper
  def likers_of(post)
    votes = post.votes_for.up.by_type(User)
    
    if votes.count < 4
      list_likers(votes)
    else
      recent_liker_and_count(votes)
    end
  end
  
  private
  
  def list_likers(votes)
    likers = []
    votes.voters.each do |user|
      likers << link_to(user.user_name, profile_path(user.user_name))
    end
    
    likers.to_sentence.html_safe + pluralize_likes(likers.count) if likers.count > 0
  end
  
  def recent_liker_and_count(votes)
    count = votes.voters.count
    recent_liker = votes.voters.first
    
    result = []
    result << link_to(recent_liker.user_name, profile_path(recent_liker.user_name))
    result << " #{count -1} others like this"
    
    result.to_sentence.html_safe
  end

  def pluralize_likes(count)
    if count > 1 
      ' like this'
    else
      ' likes this'
    end
  end
end