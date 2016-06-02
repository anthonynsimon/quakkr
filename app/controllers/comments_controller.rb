class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_post
  before_action :set_comment, only: [:destroy]
  before_action :authorize_destroy, only: [:destroy]

  def index
    @comments = @post.comments.order('created_at ASC')

    respond_to do |format|
      # Don't render the app layout, just the comments partial
      format.html { render layout: false }
    end
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      create_notification @post, @comment
      respond_to do |format|
        format.html { redirect_to post_path(@post) }
        format.js
      end
    else
      flash[:alert] = 'Something went wrong'
      redirect_to post_path(@post)
    end
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        format.html do
          flash[:notice] = 'Comment deleted successfully.'
          redirect_to post_path(@post)
        end
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def create_notification(post, comment)
    unless post.user.id == current_user.id
      Notification.create(
        user_id: post.user.id,
        notified_by_id: current_user.id,
        post_id: post.id,
        identifier: comment.id,
        event_type: 'comment'
      )
    end
  end

  def authorize_destroy
    redirect_to root_path if current_user.id != @comment.user_id
  end
end
