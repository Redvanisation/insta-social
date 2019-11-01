# frozen_string_literal: true

require 'rails_helper'

feature 'OmniAuth testing' do


    scenario 'Checks if it redirects to facebook' do
        # visit root_path
        visit new_user_registration_path

        
        click_on 'Sign up with Facebook'
        # expect(page).to have_content('Sign in with Facebook')
    end
end