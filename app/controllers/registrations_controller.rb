# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController

  def create
    super do
      @user.update_attribute(:avatar_id, @user.make_gravatar_id)
    end
  end
end
