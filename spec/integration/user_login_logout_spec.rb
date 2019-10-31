# frozen_string_literal: true

require 'rails_helper'

feature 'User login' do
  let(:user) { create(:user) }

  scenario 'Checks if user can login with valid data' do
    login user

    expect(page).to have_content('Signed in successfully')
  end

  scenario "Checks if user can't login with invalid data" do
    user.email = '123@bla.'
    login user
    expect(page).to have_content('Log in')
  end

  scenario "Logged in user can't sign up" do
    login user
    visit new_user_registration_path
    expect(page).to have_content('You are already signed in')
  end

  scenario 'Checks if user is logged out' do
    login user
    click_link 'Logout'
    expect(page).to have_content('Signed out successfully')
  end
end
