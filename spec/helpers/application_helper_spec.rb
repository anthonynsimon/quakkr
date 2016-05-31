require 'rails_helper'

describe ApplicationHelper do
  describe "#bootstrap_class_for(flash_type)" do
    it "maps the success type" do
      expect(bootstrap_class_for "success").to eq("alert-success")
    end
    
    it "maps the error type" do
      expect(bootstrap_class_for "error").to eq("alert-danger")
    end
    
    it "maps the alert type" do
      expect(bootstrap_class_for "alert").to eq("alert-warning")
    end
    
    it "maps the notice type" do
      expect(bootstrap_class_for "notice").to eq("alert-info")
    end
  end
  
  describe "#get_user_avatar_url_for(user, size)" do
    it "returns a default avatar if user has not set one yet" do
      @user = FactoryGirl.create(:user, avatar: nil)
      avatar_url = get_user_avatar_url_for @user, :thumbnail
      expect(avatar_url.match /(\/images\/sample_avatar_[0-9].jpg)/).to_not be(nil)
    end
  end
end