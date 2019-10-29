# frozen_string_literal: true

class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships, primary_key: %i[user_id friend_id] do |t|
      t.references :user, index: true, foreign_key: true
      t.references :friend, index: true
      t.boolean :confirmed
      t.timestamps
    end
    add_foreign_key :friendships, :users, column: :friend_id
  end
end
