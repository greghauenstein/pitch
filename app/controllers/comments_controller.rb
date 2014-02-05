class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @comment = current_user.comments.create(params[:comment])
    redirect_to :back
  end
  
  def show
    @story   = Story.find(params[:id])
    @comment = Comment.new
  end
end