# frozen_string_literal: true

require 'rails_helper'

def login(user)
  visit new_user_session_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Log in'
end

def process_users(user, user2)
  login user
  click_on 'Logout'
  login user2
  click_on 'Add as a friend'
  click_on 'Logout'
  login user
  visit user_path(user)
  click_button 'Accept'
end
# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
# RSpec.describe UsersHelper, type: :helper do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
