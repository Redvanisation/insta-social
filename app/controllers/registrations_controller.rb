# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController

  def create
    super do
      @user.update_attribute(:avatar_id, make_gravatar_id(@user))
    end
  end
end
