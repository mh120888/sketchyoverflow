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
    answer = Answer.find(params[:answer_id])
    question = answer.question
    question_answers = question.answers
    render partial: 'best'
  end
end