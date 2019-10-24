FactoryBot.define do
  factory :post do
    content { "MyText" }
    user_id { 1 }
    user { nil }
  end
end
