class UsersController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :new]
  def index
  end
end
