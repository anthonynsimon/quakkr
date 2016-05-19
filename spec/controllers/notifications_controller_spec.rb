require 'rails_helper'

describe NotificationsController do
  describe 'GET #link_through' do
    it 'updates the @notification to \'read\' if user is authenticated and authorized'
    it 'rejects the request if user is not authenticated'
    it 'redirects to root path if user is not authorized'
  end
end