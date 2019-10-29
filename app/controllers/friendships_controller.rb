class FriendshipsController < ApplicationController
    
    def create
        @friendship1 = Friendship.new(friendship_params)
        @friendship1.confirmed = false

        @friendship2 = Friendship.new(user_id: friendship_params[:friend_id], friend_id: friendship_params[:user_id])
        @friendship2.confirmed = false

        if @friendship1.save && @friendship2.save

            redirect_to root_path 
            flash[:success] = "Request sent"
        else 
            render 'new'
            flash[:error] = "Something went wrong in sending the friend request"

        end
    end 

    
    def update
        @friendship1 = Friendship.find_by(user_id: friendship_params[:user_id], friend_id: friendship_params[:friend_id])
        debugger
        @friendship1.update_attribute(confirmed: true)
        @friendship2 = Friendship.find_by(user_id: friendship_params[:friend_id], friend_id: friendship_params[:user_id])
        @friendship2.update_attribute(confirmed: true)

    end
    
    def destroy

    end

    private

    def friendship_params
        params.require(:friendships).permit(:user_id, :friend_id)
    end 
end
