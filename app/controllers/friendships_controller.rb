class FriendshipsController < ApplicationController
  def index
  end

  def add_friend
    @users = User.where.not(id: current_user.id)
  end


  def create
   @friends = Friendship.new(sent_by_id: params[:sent_by_id], sent_to_id: params[:sent_to_id])
   @friends.save 
   
  end

  def view
    @u=Friendship.joins(:sent_by).select('users.*').where(:status=>0)

  end

  def accept_decline
    
        @z=Friendship.find_by(params[:sent_to_id])
        if @z.update(status: params[:status].to_i)
          flash[:notice]="update successfully"
          redirect_to root_path
        end
  end

  def friendlist
    @f=Friendship.joins(:sent_by).select('users.*').where(:status=>1)


  end

  

  
end
