class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authorize_edit, only: [:edit, :update, :destroy]

  def show
  end
  
  def edit
  end
  
  def update
    if (@user.update(profile_params))
      flash[:success] = 'Profile updated!'
      redirect_to profile_path(@user.user_name)
    else
      flash.now[:error] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end
  
  private
  
  def set_user
    @user = User.find_by(user_name: params[:user_name])
  end
  
  def profile_params
    params.require(:user).permit(:user_name, :bio, :location)
  end
  
  def authorize_edit
    if current_user != @user
      redirect_to root_path
    end
  end
end