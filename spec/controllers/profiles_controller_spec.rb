require 'rails_helper'

describe ProfilesController, :type => :controller do
  describe 'GET #show' do
    it 'assings the requested user to @user' do 
      user = FactoryGirl.create(:user)
      get :show, user_name: user.user_name
      expect(assigns(:user)).to eq(user)
    end
    
    it 'assings posts of user in path' do
      user = FactoryGirl.create(:user)
      post = FactoryGirl.create(:post, user_id: user.id)
      get :show, user_name: user.user_name
      expect(assigns(:user).posts).to include(post)
    end
    
    it 'renders the show template' do
      get :show, user_name: FactoryGirl.create(:user).user_name
      expect(response).to render_template(:show)
    end
    
    it 'renders the not found template if no user was found'
  end
  
  describe 'GET #edit' do
    it 'assings @user to edit'
    it 'renders the edit template'
    it 'rejects the request if the user is not authenticated'
    it 'rejects the request if the user is not authorized'
  end
  
  describe 'DELETE #destroy' do
    it 'deletes the @post if the user is authorized'
    it 'rejects the request if the user is not authorized'
    it 'responds to javascript'
    it 'responds to html'
  end
  
  describe 'POST #update' do
    it 'saves the new data for the profile'
    it 'rejects the request if the user is not authorized'
    it 'redirects to the #show'
  end
end