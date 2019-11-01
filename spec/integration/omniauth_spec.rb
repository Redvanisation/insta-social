# frozen_string_literal: true

require 'rails_helper'

feature 'OmniAuth testing' do
  scenario 'Checks if it redirects to facebook' do
    visit root_path
    expect(page).to have_content('Sign in with Facebook')

    click_on 'Sign in with Facebook'
    expect(page).to have_content('Facebook')
  end
end
