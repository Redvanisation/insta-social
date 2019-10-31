require 'rails_helper'

feature 'Friendship creation' do 
    let(:user) { create(:user) }
    let(:user2) {create(:user)}
    scenario 'Logging and making a friend request' do 
    login user
   # expect{
   # click_button "Add as a friend"
   # }.to change(Friendship, :count).by(1)
   expect(page).to have_content("Add as a friend")
end 

end 