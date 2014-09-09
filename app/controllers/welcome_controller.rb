class WelcomeController < ApplicationController
  def index
    @user = User.new
    @groups = Group.includes(:groups_users).all

  end


end
