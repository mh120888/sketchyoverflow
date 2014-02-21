class UserController < ApplicationController
  def show
    puts "I am now here"
    p params
    @user = User.find(params[:id])
  end
end