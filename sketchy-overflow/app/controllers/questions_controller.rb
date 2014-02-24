class QuestionsController < ApplicationController
  def index
    if session[:id]
      @logged_in = true
      @user_id = session[:id]
    end
    @questions = Question.all
    @question = Question.new
  end

  def show
    @logged_in = true if session[:id]
    @logged_in_user_id = session[:id]
    @question = Question.find(params[:id])
    @user = @question.user
    @answers = @question.answers_by_create_date
    @answer = Answer.new
    @vote = Vote.new
    @votes_count = @question.calculate_net_votes
    @net_votes = @question.calculate_net_votes
    @vote_answer = Vote.new
  end

  def new
    # @question = Question.new
  end

  def create
    user = User.find(session[:id])
    @question = user.questions.build(params[:question])
    if @question.save
      flash[:notice] = 'Question successfully posted'
      render partial: "question", locals: { question: @question }
    else
      flash[:notice] = 'Fail'
      render :new
    end
  end
end