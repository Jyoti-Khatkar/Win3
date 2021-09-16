class PostsController < ApplicationController
  def index
    #@p=Friendship.where(user_id: current_user.id,status: 1)
    
    add_user_ids=Friendship.where(:sent_by_id=>current_user.id,:status=>1).pluck(:sent_to_id)
    requested_user_ids=Friendship.where(:sent_to_id=>current_user.id,:status=>1).pluck(:sent_by_id)
  


    
    all_user_ids=(requested_user_ids + add_user_ids + [current_user.id]).uniq
    @f=User.where(:id=>all_user_ids)
   

    @posts=Post.where(user_id: @f.ids)
    post_ids=@posts.pluck(:id)
    
    
    
  end

  def show
    @post=Post.find_by(id: params[:id])
    @comments=Comment.where(post_id: @post.id).order(updated_at: :desc) if @post
    

  end

  def new
    @post=Post.new
  end

  def create
   
    @psts = Post.new(title: params[:post][:Title], content: params[:post][:Content],image: params[:post][:image],user_id: current_user.id) 
    if @psts.save
      redirect_to posts_path


   end
  end
  def addcomment
  
    @comment=Comment.new(reaction: params[:post][:reaction],user_id: current_user.id,post_id: params[:post][:Post_id])
    @comment.save
    flash[:notice]="comment updated successfully"
    redirect_back(fallback_location: posts_path)
  end
 
  def like
    #@likes=Like.new(user_id: current_user.id,post_id: params[:id])
    @likes=Like.find_by(user_id: current_user.id,post_id: params[:id])
    if @likes.present?
      if @likes.is_like == false
        @likes.update(is_like: true)
      else
        @likes.update(is_like: false)
      end

    else
      Like.create(user_id: current_user.id,post_id: params[:id])
    end

  end 
  

end
