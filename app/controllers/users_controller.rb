class UsersController < ApplicationController
  require 'csv'

  def index
    @users = User.all
  end

  def create
    @users = User.all
    @groups = Group.all

    @user = User.new(user_params)
    @file_name =(params[:user][:users_test].original_filename)
    @user.read_csv(@file_name)
    @user.database_insert

  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Updated"

      redirect_to root_path
    else
      flash[:error] = "You made a mistake.  Please enter info again."
			render(:edit)
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :role, :group_name, :group_ids => [])
  end


end
