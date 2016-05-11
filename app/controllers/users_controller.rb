class UsersController < ApplicationController
  def show

  @user=User.find(params[:id])
  @name=User.find(params[:id]).name
  @goals=Goal.where(user_id:params[:id])
  @track=Track.new
  @tracks=Track.where(goal_id: params[:id])
  @members=Member.where(user_id: current_user.id)
  @current_member=Member.where(user_id: current_user.id, status:true)

@groups=Group.all

  end


end


