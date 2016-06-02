require 'rails_helper'

describe PostsController, type: :controller do
  before :each do
    # Needed for redirect_to :back to work
    request.env['HTTP_REFERER'] = root_path

    # Setup instance variables
    @user = FactoryGirl.create(:user)
    @followed_user = FactoryGirl.create(:user)
    Follow.create(follower_id: @user.id, following_id: @followed_user.id)
    @followed_post = FactoryGirl.create(:post, user_id: @followed_user.id)
    @non_followed_post = FactoryGirl.create(:post)

    # Every test assumes that there is a signed in user already
    sign_in @user
  end

  describe 'GET #index' do
    it 'assings @posts of followed users' do
      get :index
      expect(assigns(:posts)).to include(@followed_post)
      expect(assigns(:posts)).to_not include(@non_followed_post)
    end

    it 'is not accessible to guest users' do
      sign_out @user
      get :index
      expect(response).to redirect_to new_user_session_path
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #browse' do
    it 'assings recent @posts of any user' do
      get :browse
      expect(assigns(:posts)).to include(@non_followed_post)
    end

    it 'renders the browse template' do
      get :browse
      expect(response).to render_template(:browse)
    end
  end

  describe 'POST #create' do
    it 'assigns new post to @post if successfully created' do
      post :create, post: { message: Faker::Lorem.sentence }
      expect(assigns(:post)).to_not be(nil)
    end

    it 'creates a new post if the user is logged in' do
      expect {
        post :create, post: { message: Faker::Lorem.sentence }
      }.to change(Post, :count).by(1)
    end

    it 'does not create a new post if the user is not logged in' do
      sign_out @user
      expect {
        post :create, post: { message: Faker::Lorem.sentence }
      }.to_not change(Post, :count)
    end
  end

  describe 'GET #show' do
    it 'assings @post of post in path' do
      get :show, id: @non_followed_post.id
      expect(assigns(:post)).to_not be(nil)
    end

    it 'renders the show template' do
      get :show, id: @non_followed_post.id
      expect(response).to render_template(:show)
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @new_post = FactoryGirl.create(:post, user_id: @user.id)
    end

    it 'deletes the @post if the user is authorized' do
      expect {
        delete :destroy, id: @new_post.id
      }.to change(Post, :count).by(-1)
    end

    it 'does not delete the @post if the user is not authorized' do
      sign_in FactoryGirl.create(:user)
      expect {
        delete :destroy, id: @new_post.id
      }.to_not change(Post, :count)
    end

    it 'does not delete the @post if the user is not authenticated' do
      sign_out @user
      expect {
        delete :destroy, id: @new_post.id
      }.to_not change(Post, :count)
    end
  end

  describe 'GET #like' do

    it 'likes the @post if the user is authenticated' do
      expect {
        get :like, id: @followed_post.id
      }.to change { @followed_post.votes_for.up.by_type(User).count }.by(1)
    end

    it 'does not like the post again if the user already liked it' do
      expect{
        2.times do
          get :like, id: @followed_post.id
        end
      }.to change { @followed_post.votes_for.up.by_type(User).count }.by(1)
    end

    it 'redirects the request if the user is not authenticated' do
      sign_out @user
      get :like, id: @followed_post.id
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe 'GET #unlike' do
    before :each do
      get :like, id: @followed_post.id
    end

    it 'unlikes the @post if the user is authenticated' do
      expect {
        get :unlike, id: @followed_post.id
      }.to change { @followed_post.votes_for.up.by_type(User).count }.by(-1)
    end

    it 'does not reduce likes if the user hasn\'t liked the post' do
      expect {
        2.times { get :unlike, id: @followed_post.id }
      }.to change { @followed_post.votes_for.up.by_type(User).count }.by(-1)
    end

    it 'redirects the request if the user is not authenticated' do
      sign_out @user
      get :unlike, id: @followed_post.id
      expect(response).to redirect_to new_user_session_path
    end
  end
end
