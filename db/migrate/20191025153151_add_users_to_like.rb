# frozen_string_literal: true

class AddUsersToLike < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :user_id, :integer
  end
end
