class GoalsController < ApplicationController
 
 def index

    @goals = Goal.all
  end
  
  def new
    @goal = Goal.new

    @track=Track.new
  end

  def create
    Goal.create(goal_params)
    redirect_to action: :index
 
  end

   def create2
    Goal.create(goal_params2)
    redirect_to action: :index
 
  end




    
  def commentcreate
 
      @comments=Comment.where(goal_id: params[:id])
     
      Comment.create(comment_params)
      

  end

def show

  @comment=Comment.new
  @comments=Comment.where(goal_id: params[:id])


  @goal = Goal.find(params[:id])
  @total = 0
  @progs = Track.where(goal_id: params[:id])
  @aim = Goal.find(params[:id])


end

def prshow

  @comment=Comment.new
  @comments=Comment.where(goal_id: params[:id])

  @goal = Goal.find(params[:id])
  @total = 0
  @progs = Track.where(goal_id: params[:id])
  @aim = Goal.find(params[:id])
end







  private
  
  def goal_params

    params[:goal][:deadline]= DateTime.parse(params[:goal][:deadline])
    params[:goal][:type] = 1
    params.require(:goal).permit(:goal_name,:quantity,:frequency,:qunit, :frequency_unit, :type).merge(user_id: current_user.id)

  end

 def goal_params2

    params[:goal][:type] = 2
    params.require(:goal).permit(:goal_name,:quantity,:frequency,:qunit, :deadline, :frequency_unit, :type).merge(user_id: current_user.id)

  end


  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id).merge(goal_id: params[:id])
  end



end
