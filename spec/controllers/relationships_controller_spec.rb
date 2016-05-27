require 'rails_helper'

describe RelationshipsController do
  before :each do
    # Needed for redirect_to :back to work
    request.env["HTTP_REFERER"] = root_path
    
    @user = FactoryGirl.create(:user)
    @other_user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe 'POST #create' do
    it 'creates a relationship between current user and user in params' do
      expect{
        post :create, user_name: @other_user.user_name
      }.to change(Follow, :count).by(1)
    end
    
    it 'redirects the request if the user is not authenticated' do
      sign_out @user
      post :create, user_name: @other_user.user_name
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      post :create, user_name: @other_user.user_name
    end
  
    it 'deletes the @relationship if the user is authorized' do
      expect{
        delete :destroy, user_name: @other_user.user_name
      }.to change(Follow, :count).by(-1)
    end
    
    it 'checks for the existence of a relationship before removing it' do
      expect{
        2.times do
          delete :destroy, user_name: @other_user.user_name
        end
      }.to change(Follow, :count).by(-1)
    end
    
    it 'redirects the request if the user is not authenticated' do
      sign_out @user
      delete :destroy, user_name: @other_user.user_name
      expect(response).to redirect_to new_user_session_path
    end
  end
end