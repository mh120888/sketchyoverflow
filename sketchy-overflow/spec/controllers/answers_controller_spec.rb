require 'spec_helper'

describe AnswersController do
  context "#create" do
    it "creates a new question with content" do
      expect {
        post :create, answer: FactoryGirl.attributes_for(:answer)
      }.to change { Answer.count }.by(1)
    end
    it "does not create a new question without content" do
      expect {
        post :create
      }.not_to change { Answer.count }
    end
  end

  context "#best" do
    let(:question) { FactoryGirl.create(:question) }
    let(:answer) { FactoryGirl.create(:answer) }
    let(:answer_clear) { FactoryGirl.create(:answer) }

    it "should assign best to an answer" do
      question.answers << answer
      put :best, { answer_id: answer.id }
      answer.reload
      expect(answer.best).to eq 1
    end

    it "should clear out all other best" do
      question.answers << answer
      question.answers << answer_clear
      answer_clear.best = 1
      answer_clear.save
      answer_clear.reload
      expect(answer_clear.best).to eq 1
      put :best, { answer_id: answer.id }
      answer_clear.reload
      expect(answer_clear.best).to eq 0
    end
  end
end