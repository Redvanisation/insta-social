# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:id) { |n| n }
    sequence(:username) { |n| "User-#{n}" }
    sequence(:email) { |n| "User-#{n}@example.com" }
    password { 'MyString' }
    password_confirmation { 'MyString' }
  end
end
