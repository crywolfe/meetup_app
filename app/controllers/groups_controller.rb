class GroupsController < ApplicationController
  def index
    @groups = Group.includes(:groups_users).all
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
    # @groups = Group.includes(:groups_users).all
    @users = User.all
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
    @group_user = @group.users.find(params[:id])
    # if @group.update(group_params)
    #   # redirect
    # else
    #   # render
    # end
  end

  def update

    @group = Group.find(params[:id])
    @group_name = @group.name
    @users = User.all
    @group.update(:name => params[:group][:name])
    @users.each do |user|
      binding.pry
      if user.group_name == @group_name
        user.update(:group_name => params[:group][:name])
      end
    end
    # @group

    # if @group.update(group_params)
    #   # redirect
    # else
    #   # render
    # end
  end

  def destroy
    binding.pry
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to(root_path)
  end

  private
  def group_params
    params.require(:group).permit(:name, :user_ids => [])
  end

end
