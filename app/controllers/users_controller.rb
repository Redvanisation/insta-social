class UsersController < ApplicationController
before_action :authenticate_user!, :except => [:index, :new]

    def index
        @users = User.all
    end
end
