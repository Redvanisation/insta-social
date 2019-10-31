# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(friendship_params)
    @friendship.confirmed = false

    if @friendship.save
      flash[:success] = 'Request sent'
    else
      flash[:error] = 'Friend request has not been sent'
    end
    redirect_to root_path
  end

  def update
    @friendship = Friendship.find_by(user_id: friendship_params[:user_id], friend_id: friendship_params[:friend_id])
    debugger
    @friendship.confirmed = true 
    @friendship.save
    @inverse_friendship = Friendship.new(friend_id: friendship_params[:user_id], user_id: friendship_params[:friend_id])
    @inverse_friendship.confirmed = true
    @inverse_friendship.save
    
    redirect_to user_path(current_user)
  end

  def destroy; end

  private

  def friendship_params
    params.require(:friendships).permit(:user_id, :friend_id)
  end
end
