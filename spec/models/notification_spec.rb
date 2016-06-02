require 'rails_helper'

describe Notification do
  describe '#new' do
    it 'returns a new instance of notification' do
      expect(FactoryGirl.build(:notification)).to be_valid
    end

    it 'is invalid without a user id' do
      expect(FactoryGirl.build(:notification, user_id: nil)).to_not be_valid
    end

    it 'is invalid without a post id' do
      expect(FactoryGirl.build(:notification, post_id: nil)).to_not be_valid
    end

    it 'is invalid without an identifier' do
      expect(FactoryGirl.build(:notification, identifier: nil)).to_not be_valid
    end

    it 'is invalid without an event type' do
      expect(FactoryGirl.build(:notification, event_type: nil)).to_not be_valid
    end

    it 'is invalid without a the notifier\'s id' do
      expect(FactoryGirl.build(:notification, notified_by: nil)).to_not be_valid
    end

  end

  describe '#user' do
    it 'returns the user to be notified' do
      user = FactoryGirl.create(:user)
      notification = FactoryGirl.create(:notification, user_id: user.id)

      expect(notification.user).to eq(user)
    end
  end

  describe '#post' do
    it 'returns the post where the event occurred' do
      post = FactoryGirl.create(:post)
      notification = FactoryGirl.create(:notification, post_id: post.id)

      expect(notification.post).to eq(post)
    end
  end

  describe '#notified_by' do
    it 'returns the user who triggered the notification event' do
      user = FactoryGirl.create(:user)
      notification = FactoryGirl.create(:notification, notified_by_id: user.id)

      expect(notification.notified_by).to eq(user)
    end
  end
end
