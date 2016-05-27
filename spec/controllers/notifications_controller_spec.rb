require 'rails_helper'

describe NotificationsController do
  before :each do
    create_notification
  end

  describe 'GET #link_through' do
    it 'updates the @notification to \'read\' if user is authenticated and authorized' do
      sign_in @user      
      expect(@notification.read).to be false
      get :link_through, id: @notification.id
      @notification = Notification.find(@notification.id)
      expect(@notification.read).to be true
    end
    
    it 'redirects the request if user is not authenticated' do
      get :link_through, id: @notification.id
      expect(response).to redirect_to new_user_session_path
      expect(@notification.read).to be false
    end
    
    it 'redirects to root path if user is not authorized' do
      sign_in FactoryGirl.create(:user)
      get :link_through, id: @notification.id
      expect(response).to redirect_to root_path
      expect(@notification.read).to be false
    end
  end
  
  def create_notification
    @user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user_id: @user.id)
    comment = FactoryGirl.create(:comment, user_id: Random.new.rand(1024), post_id: post.id)
    @notification = FactoryGirl.create(:notification,
      user_id: post.user_id,
      notified_by_id: comment.user_id,
      post_id: post.id,
      identifier: comment.id,
      event_type: 'comment')
  end
end