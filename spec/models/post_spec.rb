require 'rails_helper'

describe Post do
  describe '#new' do
    it 'returns a new instance' do
      expect(FactoryGirl.build(:post, user_id: nil)).to_not be_valid
    end
    
    it 'is invalid without a user_id' do
      expect(FactoryGirl.build(:post, user_id: nil)).to_not be_valid
    end
    
    it 'is invalid without a message' do
      expect(FactoryGirl.build(:post, message: nil)).to_not be_valid
    end
    
    it 'is invalid if message is too short' do
      expect(FactoryGirl.build(:post, message: 'a')).to_not be_valid
    end

    it 'is invalid if message is too long' do
      expect(FactoryGirl.build(:post, message: Faker::Lorem.characters(301))).to_not be_valid
    end
  end
  
  describe '#user' do
    it 'returns the user who created the post' do
      is_expected.to belong_to(:user)
    end
  end
  
  describe '#comments' do
    it 'returns the comments made on the post' do
      is_expected.to have_many(:comments)
    end
  end
  
  describe '#notifications' do
    it 'returns all notifications for activity on the post' do
      is_expected.to have_many(:notifications)
    end
  end
  
  describe '.by_users' do
    it 'returns posts created by specified users' do
      user = FactoryGirl.create(:user)
      post = FactoryGirl.create(:post, user_id: user.id)
      
      expect(Post.by_users(user).first).to eq(post)
    end
  end
end