class SessionsController < ApplicationController

  def new
    @session = Session.new
  end

  def create
    if User.authenticate(params)
      session[:id] = params[:id]
    else
      render :new
    end
  end

end