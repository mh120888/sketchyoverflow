require 'spec_helper'

describe "Answers" do
  context "creating a question" do
    let!(:user) { FactoryGirl.create :user}
    let!(:question) { FactoryGirl.create :question, user: user}
    it "creates a question and renders it dynamically via AJAX" do
      visit new_user_path
      fill_in "Name", with: "Totally New User"
      fill_in "Password", with: "password123"
      click_button "Create User"
      visit question_path(question)
      fill_in("answer[content]", with: "Applesauce")
      click_on("Create Answer")
      expect(page).to have_content("Applesauce")
    end

    it "throws an error if create answer form is submitted without content" do
      visit new_user_path
      fill_in "Name", with: "Totally New User"
      fill_in "Password", with: "password123"
      click_button "Create User"
      visit question_path(question)
      click_on("Create Answer")
      expect(page).to have_content("Content can't be blank")
    end
  end
  context 'an unauthenticated user' do
    let!(:user) { FactoryGirl.create :user}
    let!(:question) { FactoryGirl.create :question, user: user}
    it 'cannot allow an unauthenticated user to post an answer' do
      visit question_path(question)
      expect(page).not_to have_css('#answer_form')
    end
  end
end