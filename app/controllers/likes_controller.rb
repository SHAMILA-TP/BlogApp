class LikesController < ApplicationController
  before_action :set_likeable

  def create
    @like = @likeable.likes.find_or_create_by user: current_user
    redirect_to :posts
  end

  def destroy
    @like = @likeable.likes.find_by user: current_user
    @like&.destroy
    redirect_to :posts
  end

  def set_likeable
    if params[:comment_id]
      @likeable = Comment.find(params[:comment_id])
    else
      @likeable = Post.find(params[:post_id])
    end
  end
end
