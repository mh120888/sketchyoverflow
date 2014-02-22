require 'spec_helper'

describe AnswersController do
  context "#create" do
    it "creates a new question" do
      expect {
        post :create, answer: FactoryGirl.attributes_for(:answer)
      }.to change { Answer.count }.by(1)
    end
  end
end