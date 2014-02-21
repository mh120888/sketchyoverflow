require 'spec_helper'

describe "Questions" do
  context "#index" do

    let!(:question) { FactoryGirl.create :question }

    it 'displays all questions' do
      visit root_path
      expect(page).to have_content(question.content)
    end

    context 'logged in' do
      it 'a question appears on the home page when posted' do
        visit root_path
        fill_in('Title', :with => 'Dry skin') 
        fill_in('Content', :with => 'I have dry skin. What do I do?')
        click_on('Create Question')
        expect(current_path) == questions_path
        expect(page).to have_content('Dry skin')
      end
    end
      
    context 'not logged in' do
      it 'does not display the new question form' do
        pending
      end
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