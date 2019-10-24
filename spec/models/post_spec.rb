require 'rails_helper'

RSpec.describe Post, type: :model do
let(:user){create(:user)}
let(:post){user.posts.build(content:"Content for the user")}
let(:post2){build(:post)}

describe "Testing for post presence and validation" do
it "Checks if the post content is present" do
  post.content = ""
  expect(post).not_to be_valid
end

it "Checks if the post has a user" do
expect(post2).not_to be_valid
end

end
end
