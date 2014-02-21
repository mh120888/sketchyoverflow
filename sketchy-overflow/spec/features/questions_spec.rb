require 'spec_helper'

describe "Questions" do
  context "#index" do
    let!(:question) { FactoryGirl.create :question }
    it "displays all questions" do
      visit root_path
      expect(page).to have_content(question.content)
    end
  end

  context "#show" do
    let!(:user) { FactoryGirl.create :user}
    let!(:question) { FactoryGirl.create :question, user: user }
    let!(:answer) { FactoryGirl.create :answer, question: question }
    it "displays the question and user info" do
      visit question_path(question)
      expect(page).to have_content(question.content)
      expect(page).to have_content(user.name)
    end
    it "displays associated questions" do
      visit question_path(question)
      expect(page).to have_content(answer.content)
    end
  end
end