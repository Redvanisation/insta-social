class FriendshipsController < ApplicationController


    def create
        @friendship1 = Friendship.new(friendship_params)	      
        @friendship1 = Friendship.new(friendship_params)
        @friendship1.confirmed = false	       
        @friendship1.confirmed = false
        @friendship2 = Friendship.new(user_id: friendship_params[:friend_id], friend_id: friendship_params[:user_id])	      
        @friendship2 = Friendship.new(user_id: friendship_params[:friend_id], friend_id: friendship_params[:user_id])
        @friendship2.confirmed = false	        
        @friendship2.confirmed = false
    
        if @friendship1.save && @friendship2.save	        
            if @friendship1.save && @friendship2.save
            redirect_to root_path 	            
            redirect_to root_path 
            flash[:success] = "Request sent"	            
            flash[:success] = "Request sent"
        else 	       
        else 
            render 'new'	            
            render 'new'
            flahs[:error] = "Something went wrong in sending the friend request"	           
             flash[:error] = "Something went wrong in sending the friend request"
    
        end	      
      end
        end

    def update
        @friendship = Friendship.find_by(:user_id,:friend_id => params[:user_id,:friend_id])	        @friendship1 = Friendship.find_by(user_id: friendship_params[:user_id], friend_id: friendship_params[:friend_id])
        debugger
        @friendship1.update_attribute(confirmed: true)
        @friendship2 = Friendship.find_by(user_id: friendship_params[:friend_id], friend_id: friendship_params[:user_id])
        @friendship2.update_attribute(confirmed: true)

    end	    




end
