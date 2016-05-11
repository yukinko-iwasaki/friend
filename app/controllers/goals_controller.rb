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
    Track.create(goal_id:  Goal.last(1).first.id, user_id: current_user.id, quantity: 0)

  end

   def createcheck
     
    Goal.create(goal_params_check)
    redirect_to action: :index
    Track.create(goal_id:  Goal.last(1).first.id, user_id: current_user.id, quantity: 0)


 
  end




    
  def commentcreate
 
      @comments=Comment.where(goal_id: params[:id]).order("created_at DESC")
     
      Comment.create(comment_params)
      

  end

def show
 
  @comment=Comment.new
  @comments=Comment.where(goal_id: params[:id]).order("created_at DESC")

  @track=Track.new

  @tracks=Track.where(goal_id: params[:id])

  @goal = Goal.find(params[:id])

  @rest=(Goal.find(params[:id]).deadline - Date.today).to_i

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
    params[:goal][:goaltype] = 1
    params.require(:goal).permit(:goal_name,:quantity,:frequency,:qunit, :frequency_unit, :goaltype, :deadline).merge(user_id: current_user.id)

  end

 def goal_params_check
  params[:goal][:deadline]= DateTime.parse(params[:goal][:deadline])
    params[:goal][:goaltype] = 2
    params.require(:goal).permit(:goal_name,:quantity,:frequency,:qunit, :deadline, :frequency_unit, :goaltype).merge(user_id: current_user.id)

  end


  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id).merge(goal_id: params[:id])
  end



end
