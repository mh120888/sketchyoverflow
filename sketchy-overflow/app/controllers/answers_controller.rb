class AnswersController < ApplicationController
  def create
    if session[:id]
      @logged_in = true
      @logged_in_user_id = session[:id]
    end
    new_answer = Answer.new(params[:answer])
    if new_answer.save
      render partial: 'answer', locals: { answer: new_answer }
    else
      render text: new_answer.errors.full_messages.join(', '), status: :unprocessable_entity
    end
  end
end