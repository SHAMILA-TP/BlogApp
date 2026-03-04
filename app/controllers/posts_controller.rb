class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # before_action :require_login, except: [:index, :show]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.user = current_user
    if @post.save
      redirect_to @post, notice: "Post Created Successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @post.user = current_user
    if @post.update post_params
      redirect_to @post, notice: "Post Updated Successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
    
  end

  def destroy
    if @post.destroy
        redirect_to posts_path, notice: "Post Deleted Successfully!"
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id, :image)
  end
end
