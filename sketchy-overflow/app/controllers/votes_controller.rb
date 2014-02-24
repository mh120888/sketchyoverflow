class VotesController < ApplicationController
  def create
    answer = Vote.create(params[:vote]).answer
    render partial: 'answers/blank_answer', locals: { count: answer.calculate_net_votes }
  end
end