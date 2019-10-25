class RegistrationsController < Devise::RegistrationsController
include UsersHelper
def create
  super do
@user.update_attribute(:avatar_id, make_gravatar_id(@user))

end
end


end
