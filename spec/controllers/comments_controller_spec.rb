require 'rails_helper'

describe CommentsController do
  before :each do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post, user: @user)
    @comment = FactoryGirl.create(:comment, post_id: @post.id, user_id: @user.id)
  end

  describe 'GET #index as nested resource' do
    before :each do
      get :index, post_id: @post.id
    end
  
    it 'assigns @post' do
      expect(assigns(:post)).to eq(@post)
    end
    
    it 'assigns @comments of @post' do
      expect(assigns(:comments)).to include(@comment)
    end
    
    it 'renders the comments template' do
      expect(response).to render_template(:index)
    end
  end
  
  describe 'POST #create as nested resource' do
    before :each do
      @body = Faker::Lorem.sentence
    end
    
    it 'creates a new comment if the user is logged in' do
      sign_in @user
      create_comment
      expect(assigns(:comment).body).to eq(@body)
    end
    
    it 'rejects a new comment if the user is not logged in' do
      create_comment 
      expect(response).to redirect_to new_user_session_path
    end
    
    def create_comment
      post :create, post_id: @post.id, comment: { body: @body }
    end
  end
  
  describe 'DELETE #destroy' do
    it 'deletes the @comment if the user is authorized' do
      sign_in @user
      expect { 
        delete :destroy, post_id: @post.id, id: @comment
      }.to change(Comment, :count).by(-1)
    end
    
    it 'redirects the request if the user is not authenticated' do
     delete :destroy, post_id: @post.id, id: @comment
     expect(response).to redirect_to new_user_session_path
    end
    
    it 'does not delete comment is user is not authorized' do
      sign_in FactoryGirl.create(:user)
      expect {
        delete :destroy, post_id: @post.id, id: @comment
      }.to_not change(Comment, :count)
    end
  end
end