class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end
  
  def new
    @goal = Goal.new
  end

  def create
    Goal.create(goal_params)
    redirect_to action: :index
  end

    
  def commentcreate
      @comments=Comment.all
      Comment.create(comment_params)

  end

def show

  @comment=Comment.new
  @comments=Comment.all
  @goal = Goal.find(params[:id])
  @total = 0
  @progs = Track.where(goal_id: params[:id])
  @aim = Goal.find(params[:id])

end







  private

  def goal_params
    params.require(:goal).permit(:goal_name,:quantity,:frequency).merge(user_id: current_user.id)
  end

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id).merge(goal_id: params[:id])
  end



end
