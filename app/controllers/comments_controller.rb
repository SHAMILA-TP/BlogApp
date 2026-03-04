class CommentsController < ApplicationController
  before_action :set_post, only:[:create, :destroy]
  # before_action :require_login, except:[:index, :show]

  def index
    
  end

  def show
    
  end

  def create
    @comment = @post.comments.new comment_params
    @comment.user_id = User.first.id
    if @comment.save
      redirect_to @post, notice: "Comment created successfully!"
    else
      render "posts/show", status: :unprocessable_entity
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      redirect_to @post, notice: "Comment deleted successfully"
    else
      render "posts/show", status: :unprocessable_entity
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
