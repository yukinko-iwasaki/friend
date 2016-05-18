class GroupsController < ApplicationController

   def new

    @group= Group.new
    @group.members.build
    @users=User.where.not(id: current_user.id)
    @users=@users.where('name LIKE(?)',  "%#{params[:keyword]}%")


  end

def goalshow
binding.pry
member_nil_destroy
@group_id=group_id_params
@comment=Comment.new
@comments=Comment.where(goal_id: params[:goal_id]).order("created_at DESC")
@track=Track.new
@goal=Goal.find(params[:goal_id])
@rest=(Goal.find(params[:goal_id]).deadline - Date.today).to_i
@aim = Goal.find(params[:goal_id])
@tracks=Track.where(user_id:current_user.id, goal_id: params[:goal_id])
@tracksmax= @tracks.maximum('period')
@tracksmember=Track.where(goal_id:params[:goal_id])

if @goal.frequency_unit=="日"
@since=(Date.parse(DateTime.now.to_s)-Date.parse(@goal.created_at.to_s)).to_i

elsif @goal.frequency_unit=="週"
@since=(Date.parse(DateTime.now.to_s)-Date.parse(@goal.created_at.to_s)).to_i/7

else
  @since=(Date.parse(DateTime.now.to_s)-Date.parse(@goal.created_at.to_s)).to_i/30
end

create_memberlist
@tracksbyperiod=Track.where(goal_id:params[:goal_id]).unscoped.group(:user_id,:period) 

end


  def show

    @goals=Goal.where(group_id: params[:id])


    @members=Member.where(group_id: params[:id], status: true)
    @nonmembers=Member.where(group_id: params[:id], status: false)
    @users=User.all
    @group=Group.find(params[:id])

    
    @track=Track.new

  end


def shonin

@members= Member.new

end


  def create

    @group=Group.new(group_params)        # 関連オブジェクトをbuild
    @group.save
##招待者自身をメンバーに加える
@memberlast=Member.last
     Member.create(group_id: @memberlast.group_id,user_id: current_user.id, status: true)
     @grouplast=Group.last

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

def member_nil_destroy
  @member_nil=Member.where(user_id:nil)
  @member_nil.each do |m|
    m.destroy
  end
end


  private

def group_id_params
  params[:group_id]
end

  def group_params

   params.require(:group).permit(:group_name, members_attributes:[:user_id])

  end

  def goal_params_group

    params[:goal][:deadline]= DateTime.parse(params[:goal][:deadline])
    params[:goal][:goaltype] = 1
  params.require(:goal).permit(:goal_name, :deadline, :quantity, :qunit, :goaltype).merge(group_id: params[:group_id],user_id:current_user.id)

  end

 def goal_params_check_group

  params[:goal][:deadline]= DateTime.parse(params[:goal][:deadline])
    params[:goal][:goaltype] = 2
    params.require(:goal).permit(:goal_name, :deadline, :quantity, :qunit, :goaltype,:frequency, :frequency_unit).merge(group_id: params[:group_id],user_id:current_user.id)

  end

def status_params

  @status=params[:member][:check]
  if @status=="true" 
    return true
  else
    return false
  end
end

  def update_params
    params.permit(:group_id).merge(user_id: params[:id])
  end


def create_memberlist

 @members= Member.where(group_id:params[:group_id])

 @memberlist=Set.new

@members.each do |m|
  @memberlist.add(m.user_id)
end
@memberlist=@memberlist.to_a
end



end


