require 'rails_helper'

describe Comment do
  describe '#new' do
    it 'returns a new comment' do 
      expect(FactoryGirl.build(:comment)).to be_valid
    end
  
    it 'is invalid without a body' do 
      expect(FactoryGirl.build(:comment, body: nil)).to_not be_valid
    end
    
    it 'is invalid if body is to long' do
      expect(FactoryGirl.build(:comment, body: Faker::Lorem.characters(301))).to_not be_valid
    end
  end
  
  describe '#user' do
    it 'belongs to user' do
      is_expected.to belong_to(:user)
    end
  end
  
  describe '#post' do
    it 'belongs to post' do
      is_expected.to belong_to(:post)
    end
  end
end