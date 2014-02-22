require 'spec_helper'

describe "Questions" do

  context "Logged in behaviors" do
    it "create should not show when not logged in" do
      visit root_path
      expect(page).not_to have_content "What's your question?"
    end

    it "create should show when logged in" do
      visit new_user_path
      fill_in "Name", with: "Totally New User"
      fill_in "Password", with: "password123"
      click_button "Create User"
      visit root_path
      expect(page).to have_content "What's your question?"
    end
  end

  context "#index" do

    let!(:question) { FactoryGirl.create :question }

    it 'displays all questions' do
      visit root_path
      expect(page).to have_content(question.content)
    end

    context 'logged in' do
      it 'a question appears on the home page when posted' do
        visit new_user_path
        fill_in "Name", with: "Totally New User"
        fill_in "Password", with: "password123"
        click_button "Create User"
        visit root_path
        fill_in('Title', :with => 'Dry skin')
        fill_in('Content', :with => 'I have dry skin. What do I do?')
        click_on('Create Question')
        expect(current_path) == questions_path
        expect(page).to have_content('Dry skin')
      end
    end

  end

  context "#show" do
    let!(:user) { FactoryGirl.create :user}
    let!(:question) { FactoryGirl.create :question, user: user }
    let!(:answer) { FactoryGirl.create :answer, question: question }
    it "displays the question" do
      visit question_path(question)
      expect(page).to have_content(question.content)
    end
    it "displays associated questions" do
      visit question_path(question)
      expect(page).to have_content(answer.content)
    end
  end

end