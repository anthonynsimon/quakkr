require 'rails_helper'

describe ProfilesController, :type => :controller do
  before :each do
    @user = FactoryGirl.create(:user)
  end
    
  describe 'GET #show' do
    it 'assings the requested user to @user' do 
      get :show, user_name: @user.user_name
      expect(assigns(:user)).to eq(@user)
    end
    
    it 'assings posts of user in path' do
      post = FactoryGirl.create(:post, user_id: @user.id)
      get :show, user_name: @user.user_name
      expect(assigns(:user).posts).to include(post)
    end
    
    it 'renders the show template' do
      get :show, user_name: @user.user_name
      expect(response).to render_template(:show)
    end
    
    it 'renders the not found template if no user was found'
  end
  
  describe 'GET #edit' do
    it 'assings @user to edit' do
      sign_in @user
      get :edit, user_name: @user.user_name
      expect(assigns(:user)).to eq(@user)
    end
    
    it 'renders the edit template' do
      sign_in @user
      get :edit, user_name: @user.user_name
      expect(response).to render_template(:edit)
    end
    
    it 'redirects the request if the user is not authenticated' do
      get :edit, user_name: @user.user_name
      expect(response).to redirect_to new_user_session_path
    end
    
    it 'redirects the request if the user is not authorized' do
      sign_in @user
      other_user = FactoryGirl.create(:user)
      get :edit, user_name: other_user.user_name
      expect(response).to redirect_to root_path
    end
  end
  
  describe 'POST #update' do
    before :each do
      @new_bio = Faker::Lorem.sentence
    end
  
    it 'assings @user to update' do
      sign_in @user
      post :update, user_name: @user.user_name, user: { bio: @new_bio }
      expect(assigns(:user)).to eq(@user)
    end
    
    it 'updates the @user if the user is authenticated and authorized' do
      sign_in @user
      post :update, user_name: @user.user_name, user: { bio: @new_bio }
      expect(assigns(:user).bio).to eq(@new_bio)
    end
    
    it 'redirects the request if the user is not authenticated' do
      post :update, user_name: @user.user_name, user: { bio: @new_bio }
      expect(response).to redirect_to new_user_session_path
    end
    
    it 'redirects the request if the user is not authorized' do
      sign_in @user
      other_user = FactoryGirl.create(:user)
      post :update, user_name: other_user.user_name, user: { bio: @new_bio }
      expect(assigns(:user).bio).to_not eq(@new_bio)
      expect(response).to redirect_to root_path
    end
  end
end