require 'rails_helper'

describe User do
  describe '#new' do
    it 'returns a new instance of user' do
      expect(FactoryGirl.create(:user)).to be_valid
    end

    it 'is invalid without a username' do
      expect(FactoryGirl.build(:user, user_name: nil)).to_not be_valid
    end

    it 'is invalid without an email' do
      expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
    end

    it 'is invalid without a password' do
      expect(FactoryGirl.build(:user, password: nil)).to_not be_valid
    end

    it 'is invalid if username is short' do
      expect(FactoryGirl.build(:user, user_name: 'asd')).to_not be_valid
    end

    it 'is invalid if email format is wrong' do
      expect(FactoryGirl.build(:user, email: 'testemail')).to_not be_valid
    end
  end

  describe '#follows?' do
    it 'returns true if follows other user' do
      subject_user = FactoryGirl.create(:user)
      other_user = FactoryGirl.create(:user)

      Follow.create(following_id: other_user.id, follower_id: subject_user.id)

      expect(subject_user.follows?(other_user)).to be_truthy
    end

    it 'returns false if does not follow other user' do
      subject_user = FactoryGirl.create(:user)
      other_user = FactoryGirl.create(:user)

      Follow.create(following_id: subject_user.id, follower_id: other_user.id)

      expect(subject_user.follows?(other_user)).to be_falsey
    end
  end
end
