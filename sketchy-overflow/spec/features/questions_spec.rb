require 'spec_helper'

describe "Questions" do
  context "#index" do
    let!(:question) { FactoryGirl.create :question }
    it "displays all questions" do
      visit root_path
      expect(page).to have_content(question.content)
    end
    it 'allows a user to navigate to new question page' do
      visit root_path
      click_on('Ask a Question')
      expect(current_path) == new_question_path
    end
  end
  context 'New question' do
    it 'will appear on the home page when posted' do
      visit new_question_path
      fill_in('Title', :with => 'Dry skin') 
      fill_in('Content', :with => 'I have dry skin. What do I do?')
      click_on('Create Question')
      expect(current_path) == questions_path
      visit root_path
      expect(page).to have_content('Dry skin')
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