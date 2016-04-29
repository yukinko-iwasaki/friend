class CommentsController < ApplicationController


def new
  @comment=Comment.new

  
end

def create
  binding.pry
  Comment.create(:)
  redirect_to goal_url
end
