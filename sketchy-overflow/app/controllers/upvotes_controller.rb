class UpvotesController < ApplicationController
  def create
    Upvote.create(params[:upvote])
    redirect_to question_path(params[:upvote][:question_id])
  end
end