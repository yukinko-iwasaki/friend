class UsersController < ApplicationController
  def show

  @user=User.find(params[:id])
  @name=User.find(params[:id]).name
  @goals=Goal.where(user_id:params[:id])
  @track=Track.new
  @tracks=Track.where(goal_id: params[:id])
  @members=Member.where(user_id: current_user.id)
  @current_member=Member.where(user_id: current_user.id, status:true)
  @goalsgroup=Goal.where(user_id:params[:id])
  @goalsgroup=@goalsgroup.where.not(group_id: nil)
@groups=Group.all
@status= statuscontain
  end


def statuscontain

  @members=Member.where(user_id: current_user.id)
  @status=Array.new

  @members.each do |m|
    @status.push(m.status)

  end

  if @status.include?(false)
 return true
else
  return false
end


end


end


