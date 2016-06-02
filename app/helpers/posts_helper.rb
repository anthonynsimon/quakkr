module PostsHelper
  def likers_of(post)
    votes = post.votes_for.up.by_type(User)

    if votes.count < 4
      list_likers(votes)
    else
      recent_liker_and_count(votes)
    end
  end

  def like_button_for(post)
    if current_user.nil?
      link_to like_post_path(post.id), class: 'btn-sm' do
        '<i class="fa fa-heart-o" aria-hidden="true"></i>'.html_safe
      end
    else
      if current_user.voted_up_on? post
        link_to unlike_post_path(post.id), class: 'btn-sm', remote: true do
          '<i class="fa fa-heart" aria-hidden="true"></i>'.html_safe
        end
      else
        link_to like_post_path(post.id), class: 'btn-sm', remote: true do
          '<i class="fa fa-heart-o" aria-hidden="true"></i>'.html_safe
        end
      end
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
    result << " #{count - 1} others like this"

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
