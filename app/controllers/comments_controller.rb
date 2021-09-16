class CommentsController < ApplicationController
  def new
    #@comments=Post.all.order(updated_at: :desc)
  end

  def create
    
  end
  def index
    # @p=Friendship.where(user_id: current_user.id,status: 1)
    # @posts=Post.all.order(updated_at: :desc)
    # post_ids=@posts.pluck(:id)
    # @comments=Comment.where(post_id: post_ids)
  end
end
