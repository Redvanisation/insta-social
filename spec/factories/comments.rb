# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    body { 'MyText' }
    # user_id { 1 }
    # post_id { 1 }
    # user { nil }
  end
end
