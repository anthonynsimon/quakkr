class ProfilesController < ApplicationController
  def show
    @user = User.find_by(user_name: params[:user_name])
  end
end