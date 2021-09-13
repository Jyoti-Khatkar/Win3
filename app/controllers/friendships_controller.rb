class FriendshipsController < ApplicationController
  def index
  end

  def add_friend

    add_user_ids=Friendship.where(:sent_by_id=>current_user.id).pluck(:sent_to_id)
    requested_user_ids=Friendship.where(:sent_to_id=>current_user.id).pluck(:sent_by_id)
    all_user_ids=[current_user.id]
    all_user_ids=(all_user_ids + requested_user_ids + add_user_ids).uniq

    @users = User.where.not(id: all_user_ids)

  end


  def create
   @friends = Friendship.new(sent_by_id: params[:sent_by_id], sent_to_id: params[:sent_to_id])
   @friends.save 
   
  end

  def view
    @u=Friendship.joins(:sent_by).select('users.*').where(:sent_to_id=>current_user.id,:status=>0)

  end

  def accept_decline
    
        @z=Friendship.where(:sent_to_id=>current_user.id,:sent_by_id=>params[:sent_by_id]).first
        if @z.update(status: params[:status].to_i)
          flash[:notice]="update successfully"
          redirect_to root_path
        end
  end

  def friendlist
    add_user_ids=Friendship.where(:sent_by_id=>current_user.id,:status=>1).pluck(:sent_to_id)
    requested_user_ids=Friendship.where(:sent_to_id=>current_user.id,:status=>1).pluck(:sent_by_id)
    
    all_user_ids=(requested_user_ids + add_user_ids).uniq
    @f=User.where(:id=>all_user_ids)


  end

  

  
end
