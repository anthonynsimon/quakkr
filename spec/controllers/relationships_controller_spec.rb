require 'rails_helper'

describe RelationshipsController do
  describe 'DELETE #destroy' do
    it 'deletes the @relationship if the user is authorized'
    it 'rejects the request if the user is not authorized'
    it 'responds to javascript'
  end
  
  describe 'POST #create' do
    it 'creates a relationship between current user and user in params'
    it 'rejects the request if the user is not authorized'
    it 'responds to javascript'
  end
end