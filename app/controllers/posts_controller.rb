class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :destroy, :like, :unlike]
  before_action :set_post, only: [:show, :destroy, :like, :unlike]
  before_action :authorize_edit, only: [:edit, :destroy]

  def index
    @posts = Post.by_users(current_user.following).order(:created_at).reverse_order.page params[:page]
  end

  def browse
    @posts = Post.order(:created_at).reverse_order.page params[:page]
  end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post }
        format.json { render :show, status: :created, location: @post }
        format.js
      else
        format.html { redirect_to posts_path }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    if @post.liked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  def unlike
    if @post.unliked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:message)
  end

  def authorize_edit
    redirect_to root_path if current_user != @post.user
  end
end
