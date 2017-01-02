class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    group.save
    redirect_to new_group_path
  end

  private
  def group_params
    params.require(:group).permit(:name, users_attributes: [:name])
  end
end
