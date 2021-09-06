class FriendRequestsController < ApplicationController
  def index
  end

  def add_friend
    @friend = User.all
  end
end
