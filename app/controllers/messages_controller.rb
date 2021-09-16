class MessagesController < ApplicationController

    def index
    
       #@recievers=Message.joins(:reciever).select('users.*').where(:sender_id=>current_user.id)
       add_user_ids=Friendship.where(:sent_by_id=>current_user.id,:status=>1).pluck(:sent_to_id)
       requested_user_ids=Friendship.where(:sent_to_id=>current_user.id,:status=>1).pluck(:sent_by_id)
    
       all_user_ids=(requested_user_ids + add_user_ids).uniq
       @recievers=User.where(:id=>all_user_ids)

 
    end
    
    
  def show
    
    @reciever = User.where(id: params[:id].to_i).first
    @messages = Message.joins("LEFT OUTER JOIN users on messages.sender_id = users.id").select("users.name, messages.*").where(:sender_id => [params[:id], current_user.id]).order("messages.created_at")

  end
  def addmessage
    @msg=Message.new(sms: params[:user][:sms],reciever_id: params[:user][:user_id].to_i,sender_id: current_user.id)
    @msg.save
    #flash[:notice]="comment updated successfully"
    redirect_back(fallback_location: posts_path)
  end
  
    
  end
  