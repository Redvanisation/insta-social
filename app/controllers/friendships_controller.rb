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
        @friendship = Friendship.find_by(:user_id,:friend_id => params[:user_id,:friend_id])
    end
    
    def destroy

    end

    private

    def friendship_params
        params.require(:friendship).permit(:user_id, :friend_id)
    end 
end
