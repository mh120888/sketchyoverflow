require 'spec_helper'

describe "Answers" do
  context "creating a question" do
    let!(:user) { FactoryGirl.create :user}
    let!(:question) { FactoryGirl.create :question, user: user}
    it "creates a question and renders it dynamically via AJAX" do
      visit question_path(question)
      fill_in("answer[content]", with: "Applesauce")
      click_on("Create Answer")
      expect(page).to have_content("Applesauce")
    end

    it "throws an error if create answer form is submitted without content" do
      visit question_path(question)
      click_on("Create Answer")
      expect(page).to have_content("Content can't be blank")
    end
  end
end