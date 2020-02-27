# frozen_string_literal: true

require 'rails_helper'

feature 'User signup' do
  let(:user) { build(:user) }

  scenario 'user can sign up with valid data' do
    visit new_user_registration_path
    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password_confirmation

    expect do
      click_button 'Sign up'
    end.to change(User, :count).by(1)
  end
end
