require 'rails_helper'

describe ProfilesController do
  describe 'GET #show' do
    it 'assings @posts of user in path'
    it 'renders the show template'
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