class AnswersController < ApplicationController
  def create
    new_answer = Answer.new(params[:answer])
    if new_answer.save
      render partial: 'answer', locals: { answer: new_answer }
    else
      render text: new_answer.errors.full_messages.join(', '), status: :unprocessable_entity
    end
  end
end