# frozen_string_literal: true

class AddAvatarIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar_id, :string
  end
end
