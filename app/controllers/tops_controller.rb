
class TopsController < ApplicationController

   def index
    @goals = Goal.all

  end

  
  def show

    @goal=Goal.find(params[:id])

    @user=Goal.find(params[:id]).users.limit(1)
    
    @tracks=Track.where(goal_id: params[:id])
     @aim = Goal.find(params[:id])
     @rest=(Goal.find(params[:id]).deadline - Date.today).to_i
    @comment=Comment.new
  @comments=Comment.where(goal_id: params[:id]).order("created_at DESC")


  end
  def about

  end

end
