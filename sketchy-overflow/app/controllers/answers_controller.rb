class AnswersController < ApplicationController
  def create
    if session[:id]
      @logged_in = true
      @logged_in_user_id = session[:id]
    end
    @vote_answer = Vote.new
    new_answer = Answer.new(params[:answer])
    if new_answer.save
      render partial: 'answer', locals: { answer: new_answer }
    else
      render text: new_answer.errors.full_messages.join(', '), status: :unprocessable_entity
    end
  end

  def best
    answer = Answer.find(5)
    question = answer.question
    question.answers.each do |q_answer|
     q_answer.best = 0
     q_answer.save
    end
    answer.best = 1
    answer.save
    render partial: 'best'
  end
end