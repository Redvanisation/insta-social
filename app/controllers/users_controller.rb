class UsersController < ApplicationController
before_action :authenticate_user!, :except => [:index, :new]


end
