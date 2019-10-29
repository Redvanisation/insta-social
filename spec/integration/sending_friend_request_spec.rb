require 'rails_helper'
feature "Friend request creation" do 
    let(:user) { create(:user) }
scenario 'Logging and making a friend request' do 

        login user
        expect do
          click_button 'Add as a friend'
        end.to change(Friendship, :count).by(2)
      
end 

end 
