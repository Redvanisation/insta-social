# frozen_string_literal: true

class AddDefaultToFriendships < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:friendships, :confirmed, from: nil, to: false)
  end
end
