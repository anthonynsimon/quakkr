class CommentsController < ApplicationController
  before_action :set_post
  
  def index
    @comments = @post.comments.order("created_at ASC")
    
    respond_to do |format|
      # Don't render the app layout, just the comments partial
      format.html { render layout: false }
    end
  end
  
  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
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
    @comment = @post.comments.find(params[:id])
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
end
