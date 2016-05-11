class GroupsController < ApplicationController

   def new

    @group= Group.new
    @group.members.build
    @users= User.where('name LIKE(?)',  "%#{params[:keyword]}%")


  end

  def show
   
    @members=Member.where(group_id: params[:id], status: true)
    @users=User.all
    @goal=Goal.find_by(group_id: params[:id])
    @rest=(@goal.deadline - Date.today).to_i

  end


def shonin

@members= Member.new

end


  def create

    @group=Group.new(group_params)        # 関連オブジェクトをbuild
    
    @group.save
    @grouplast=Group.last(1).first
    redirect_to "/groups/#{@grouplast.id}/goals/new"
  end

  def update

    @member=Member.where(update_params)
    @member.first.update(status: status_params)
    redirect_to "/users/#{current_user.id}"

  end


  def mokuhyo
  @goal = Goal.new
  end

   def create_group
  if params[:goal][:frequency_unit]==nil
    Goal.create(goal_params_group)
    redirect_to action: :index
  else
    Goal.create(goal_params_check_group)
    redirect_to action: :index
  end

    Track.create(goal_id:  Goal.last(1).first.id, user_id: current_user.id, quantity: 0)

  end



  private

  def group_params

   params.require(:group).permit(:group_name, members_attributes:[:user_id])

  end

  def goal_params_group

    params[:goal][:deadline]= DateTime.parse(params[:goal][:deadline])
    params[:goal][:goaltype] = 1
    params.require(:goal).permit(:goal_name, :deadline, :quantity, :qunit).merge(group_id: params[:group_id])

  end

 def goal_params_check_group

  params[:goal][:deadline]= DateTime.parse(params[:goal][:deadline])
    params[:goal][:goaltype] = 2
    params.require(:goal).permit(:goal_name, :deadline, :quantity, :qunit, :frequency, :frequency_unit).merge(group_id: params[:group_id])

  end

  def status_params
 
  @status=params[:member][:status]
  if @status="1" 
    return true
  else
    return false
  end
  end

  def update_params
    params.permit(:group_id).merge(user_id: params[:id])
  end

end


