require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user) {create(:user)}
  let(:friend) {create(:user)}
  let(:friendship) {Friendship.new}
  
  it "Checks if friendship model's presence" do
    friendship.save
    expect(friendship).not_to be_valid
  end

  it "Checks if friendship model's validation" do
    friendship.user_id = user.id
    friendship.friend_id = friend.id
    friendship.confirmed = true
    friendship.save
    expect(friendship).to be_valid
  end

  # it "Checks if the boolean not to be nil" do
  #   friendship.user_id = user.id
  #   friendship.friend_id = friend.id
  #   friendship.save
  #   expect(friendship.confirmed).to be(false)
  # end
end
