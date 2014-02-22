class QuestionsController < ApplicationController
  def index
    if session[:id]
      @logged_in = true
    end
    @questions = Question.all
    @question = Question.new
  end

  def show
    @logged_in = true if session[:id]
    @question = Question.find(params[:id])
    @user = @question.user
    @answers = @question.answers_by_create_date
    @answer = Answer.new
  end

  def new
    # @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      flash[:notice] = 'Question successfully posted'
      redirect_to root_path
    else
      flash[:notice] = 'Fail'
      render :new
    end
  end
end