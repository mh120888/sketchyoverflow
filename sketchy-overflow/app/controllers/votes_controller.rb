class VotesController < ApplicationController
  def create
    Vote.create(params[:vote])
    redirect_to :back
  end
end