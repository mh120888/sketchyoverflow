class VotesController < ApplicationController
  def create
    Vote.create(params[:vote])
    # redirect_to question_path(params[:vote][:question_id])
  end
end