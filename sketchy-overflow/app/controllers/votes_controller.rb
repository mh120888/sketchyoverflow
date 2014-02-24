class VotesController < ApplicationController
  def create
    answer = Vote.create(params[:vote]).answer
    render json: answer.calculate_net_votes
  end
end