# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    content { 'Hello, this is a factory content' }
    user_id { 1 }
    user { nil }
  end
end
