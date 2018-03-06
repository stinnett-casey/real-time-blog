class FriendshipsController < ApplicationController
  def index
  end

  # /friendship_search
  def search
    @name = params[:name]
    @users = User.where('first_name LIKE ? OR last_name LIKE ? OR username LIKE ?', "%#{@name}%", "%#{@name}%", "%#{@name}%").where.not(id: current_user.id)
    
    respond_to do |format|
      format.js
    end
  end

  def create
    Friendship.request(current_user, User.find(friendship_params[:friend_id]))
  end

  def update
  end

  def destroy
  end

  private

  def friendship_params
    params.require(:friendship).permit(:friend_id)
  end
end
