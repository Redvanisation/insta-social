class FriendshipsController < ApplicationController
    
    def create
        @friendship = Friendship.new(friendship_params)
        @friendship.confirmed = false

        if @friendship.save
            redirect_to root_path 
            flash[:success] = "Request sent"
        else 
            redirect_to root_path
            flash[:error] = "Something went wrong in sending the friend request"
        end
    end 

    
    def update
        @friendship = Friendship.find_by(user_id: friendship_params[:user_id], friend_id: friendship_params[:friend_id])
        debugger
        @friendship.update_attribute(confirmed: true)

    end
    
    def destroy

    end

    private

    def friendship_params
        params.require(:friendship).permit(:user_id, :friend_id)
    end 
end
