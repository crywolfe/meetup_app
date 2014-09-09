class GroupsController < ApplicationController
  def index
    @groups = Group.includes(:groups_users).all
    binding.pry
    # @groups_users = GroupsUsers.all



  end

  def create
    @group = Group.new(group_params)

    if @group.save
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
    @groups = Group.includes(:groups_users).all
    @users = User.all
    @group = Group.find(params[:id])
    # Display Users and Roles
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      # redirect
    else
      # render
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
  end

  private
  def group_params
    params.require(:group).permit(:name, :user_ids => [])
  end

end
