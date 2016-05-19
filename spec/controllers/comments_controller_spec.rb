require 'rails_helper'

describe CommentsController do
  describe 'GET #index' do
    it 'assings @post'
    it 'assings @comments of @post'
    it 'renders the comments template'
  end
  
  describe 'POST #create' do
    it 'creates a new comment if the user is logged in'
    it 'rejects a new comment if the user is not logged in'
    it 'responds to javascript'
    it 'responds to html'
  end
  
  describe 'DELETE #destroy' do
    it 'deletes the @comment if the user is authorized'
    it 'rejects the request if the user is not authorized'
    it 'responds to javascript'
    it 'responds to html'
  end
end