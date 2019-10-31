require 'rails_helper'

feature 'Friendship creation' do 
    let(:user) { create(:user) }
    let(:user2) { create(:user) }
    scenario 'Logging and making a friend request' do 

    login user
    click_on 'Logout'
    login user2

      expect do
        click_button 'Add as a friend'
      end.to change(Friendship, :count).by(1)
    end 


    scenario 'Accept friendship request' do 

        login user
        click_on 'Logout'
        login user2
        click_on 'Add as a friend'
         click_on 'Logout'
      expect(page). to have_content("Log in")
         login user 
         expect(page). to have_content("Log in")
        visit user_path(user)
        expect(page). to have_content("Pending requests")
       # click_button 'Accept'
        #  expect(Friendship.last).to be(true)
        end 
    
end 


