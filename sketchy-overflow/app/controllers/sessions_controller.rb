class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.authenticate(params[:credentials])
    if @user
      session[:id] = @user.id
      redirect_to user_path(User.find(session[:id]))
    else
      render :new
    end
  end

end