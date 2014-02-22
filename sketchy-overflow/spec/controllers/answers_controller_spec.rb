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
end