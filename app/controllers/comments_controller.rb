class CommentsController < ApplicationController
  before_action :set_post
  
  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_path(@post)
    end
  end
  
  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    
    flash[:notice] = 'Comment deleted successfully.'
    redirect_to post_path(@post)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
  
  def set_post
    @post = Post.find(params[:post_id])
  end
end
