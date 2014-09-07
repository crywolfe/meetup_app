class GroupsController < ApplicationController
  def index
    @groups = Group.includes(:groups_users).all
    binding.pry
    # @groups_users = GroupsUsers.all

    # Display Organizer(s)
    <% @groups.each do |group| %>
      <% if group.role == "organizer" %>
        <%= group.groups_users.role %>
        <% end %>
    <% end %>

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
    params.require(:group).permit(:first_name, :last_name, :role)
  end

end
