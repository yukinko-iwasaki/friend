class TracksController < ApplicationController


  def create

    @goal=Goal.find(params[:goal_id])
  if @goal.goaltype.to_i==1
    Track.create(track_params)
  else
 
    Track.create(check: check_params,goal_id: check_params_goal.to_i, user_id: check_params_user.to_i)
    
    if @goal.frequency_unit=="週"
     check_point_week
   end
   if @goal.frequency_unit=="月"
     check_point_month
   end

   if @goal.frequency_unit=="日"

     check_point_day
   end

   success

  end

    redirect_to action: :index

  end



  def index

    @tracks = Track.where(goal_id: params[:goal_id],user_id: current_user.id)
    @tracksum = Track.where(goal_id: params[:goal_id],user_id: current_user.id).sum(:quantity)
    @tracksmax= @tracks.maximum('period')
     @goal = Goal.find(params[:goal_id])

    @aim = Goal.find(params[:goal_id])
  end

def checksuccess

end



  private
  
  def track_params

   params.require(:track).permit(:quantity).merge(user_id: current_user.id).merge(goal_id: params[:goal_id])
  end


def check_params

  @check=params[:track][:check]

  if @check=="true" 
    return true
  else
    return false
  end


end

def check_params_user
  current_user.id
end

def check_params_goal
   params[:goal_id].to_i
end




def  check_point_week
  @week=Array.new
  @goal=Goal.find(params[:goal_id])
  52.times do |i|
    @week.push(@goal.created_at+ i.week)
  end

  @tracks=Track.where(user_id: current_user.id, goal_id:params[:goal_id])
    i=0

while(DateTime.now>=@week[i]) do

   @ts=@tracks.where(created_at: (@week[i])..(@week[i+1]))
   @ts.each do |t|
    t.update(period: i)
  end
    i=i+1
  end
end


def  check_point_month
  @month=Array.new
  @goal=Goal.find(params[:goal_id])
  52.times do |i|
    @month.push(@goal.created_at+ i.month)
  end

  @tracks=Track.where(user_id: current_user.id, goal_id:params[:goal_id])
    i=0

while(DateTime.now>=@month[i]) do

   @ts=@tracks.where(created_at: (@month[i])..(@month[i+1]))
   @ts.each do |t|
    t.update(period: i)
  end
    i=i+1
  end
end


def  check_point_day

  @day=Array.new
  @goal=Goal.find(params[:goal_id])
  365.times do |i|
    @day.push(@goal.created_at+ i.day)
  end

  @tracks=Track.where(user_id: current_user.id, goal_id:params[:goal_id])
    i=0

while(DateTime.now>=@day[i]) do

   @ts=@tracks.where(created_at: (@day[i])..(@day[i+1]))
   @ts.each do |t|
    t.update(period: i)
  end
    i=i+1
  end
end

def success

  @aim=Goal.find(params[:goal_id]).quantity
binding.pry
  @count=Track.where(user_id: current_user.id, goal_id:params[:goal_id]).group(:period).all.order(:period).count
  @maxperiod=Track.where(user_id: current_user.id, goal_id:params[:goal_id]).maximum(:period)
  i=Track.where(user_id: current_user.id, goal_id:params[:goal_id]).minimum(:period)

  while (i<=@maxperiod) do
  @tracks=Track.where(user_id: current_user.id, goal_id:params[:goal_id], period: i)
  if @tracks.length!=0

    @tracks.each do |track|

  if @count[i]>=@aim
    track.update(success:true)
  else
    track.update(success:false)
  end

  end
end
  i=i+1
end



end



end
