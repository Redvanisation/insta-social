require 'rails_helper'

feature 'Friendship creation' do 
    let(:user) { create(:user) }
    let(:user2) { create(:user) }
    let(:user3) { create(:user) }

    scenario 'Logging and making a friend request' do 

      login user

      if user != current_user
        click_on 'Add as a friend'
      end
      # visit '/'
      # expect{
      # click_button "Add as a friend"
      # }.to change(Friendship, :count).by(1)

      # expect(page).to have_content(user2.username)
      # expect(page).to have_content(user3.username)

      # expect do
      #   click_button 'Hello'
      # end.to change(Friendship, :count).by(1)
      # expect(page).to have_button('commit')
    end 

end 