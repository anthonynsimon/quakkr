require 'rails_helper'

describe PostsController do
  describe 'GET #index' do
    it 'assings @posts of followed users'
    it 'is not accessible to guest users'
    it 'renders the index template'
  end
  
  describe 'GET #browse' do
    it 'assings recent @posts of any user'
    it 'doesn\' allow user to post without logging in'
    it 'renders the browse template'
  end
  
  describe 'POST #create' do
    it 'creates a new post if the user is logged in'
    it 'rejects a new post if the user is not logged in'
    it 'responds to javascript'
    it 'responds to html'
  end
  
  describe 'GET #show' do
    it 'assings @post of post in path'
    it 'renders the show template'
  end
  
  describe 'DELETE #destroy' do
    it 'deletes the @post if the user is authorized'
    it 'rejects the request if the user is not authorized'
    it 'responds to javascript'
    it 'responds to html'
  end
  
  describe 'GET #like' do
    it 'likes the @post if the user is authenticated'
    it 'rejects the request if the user already liked the post'
    it 'rejects the request if the user is not authenticated'
  end
  
  describe 'GET #unlike' do
    it 'unlikes the @post if the user is authenticated'
    it 'rejects the request if the user hasn\'t liked the post'
    it 'rejects the request if the user is not authenticated'
  end
end