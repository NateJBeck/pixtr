class GroupMembershipsController < ApplicationController
  def create
 #   group_membership = GroupMembership.new(group_id: params[:group_id], 
 #                                         member_id: current_user.id)
    @group = Group.find(params[:group_id])
    @group.members << current_user
    redirect_to groups_path
  end
end
