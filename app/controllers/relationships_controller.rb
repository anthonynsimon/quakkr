class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subject_user, only: [:create, :destroy]
  before_action :set_relationship, only: [:destroy]

  def create
    @relationship = Follow.create(
      follower_id: current_user.id,
      following_id: @subject_user.id
    )
    redirect_to :back
  end

  def destroy
    @relationship.destroy unless @relationship.nil?
    redirect_to :back
  end

  private

  def set_relationship
    @relationship = Follow.find_by(
      follower_id: current_user.id,
      following_id: @subject_user.id
    )
  end

  def set_subject_user
    @subject_user = User.find_by(user_name: params[:user_name])
  end
end
