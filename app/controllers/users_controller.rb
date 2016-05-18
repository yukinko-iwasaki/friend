class UsersController < ApplicationController
  def show

  @user=User.find(params[:id])
  @name=User.find(params[:id]).name
  @goals=Goal.where(user_id:params[:id])
  @track=Track.new
  @tracks=Track.where(goal_id: params[:id])
  @members=Member.where(user_id: current_user.id)
  @nonmembers=Member.where(user_id: current_user.id,status:false)
  @current_member=Member.where(user_id: current_user.id, status:true)
  @goalsgroup=Goal.where(user_id:params[:id])
  @goalsgroup=@goalsgroup.where.not(group_id: nil)
@groups=Group.all
@status= statuscontain

groupgoal
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


def groupgoal

  @members=Member.where(user_id:params[:id],status:true)
  @group_id=Array.new
  @members.each do |m|
    @group_id.push(m.group_id)
  end
  return @group_id


end

end


