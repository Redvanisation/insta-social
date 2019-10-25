FactoryBot.define do
  factory :post do
    # post_id { 1 }
    content { "Hello, this is a factory content" }
    user_id { 1 }
    # user { nil }
  end
end
