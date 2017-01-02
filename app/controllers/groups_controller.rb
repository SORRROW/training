class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    group.save
    redirect_to edit_group_path(group)
  end

  def edit
    @group = Group.find(params.require(:id))
  end

  def update
    group = Group.find(params.require(:id))
    group.update_attributes(group_params)
    redirect_to edit_group_path(group)
  end

  private
  def group_params
    params.require(:group).permit(:name, users_attributes: [:id, :name])
  end
end
