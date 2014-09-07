class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    binding.pry

    if @user.save
      # a ok
      # redirect
    else
      #not
      # render
    end
  end

  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect
    else
      render
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :role)
  end


end
