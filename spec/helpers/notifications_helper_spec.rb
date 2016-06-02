require 'rails_helper'

describe NotificationsHelper do
  include Devise::TestHelpers

  describe '#unread_notifications' do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    it 'returns unread notifications' do
      setup_notification
      expect(helper.unread_notifications.count).to eq(1)
    end

    it 'returns no notifications if all have been read' do
      expect(helper.unread_notifications.count).to eq(0)
    end
  end

  def setup_notification
    post = FactoryGirl.create(:post, user_id: @user.id)
    create_comment(post)
    @notification = FactoryGirl.create(
      :notification,
      user_id: post.user_id,
      notified_by_id: @comment.user_id,
      post_id: post.id,
      identifier: @comment.id,
      event_type: 'comment'
    )
  end

  def create_comment(post)
    return if post.nil?
    @comment = FactoryGirl.create(
      :comment,
      user_id: Random.new.rand(1024),
      post_id: post.id
    )
  end
end
