require 'spec_helper'

describe "Questions" do
  context "#index" do
    let!(:question) { FactoryGirl.create :question }
    it "displays all questions" do
      visit root_path
      expect(page).to have_content(question.content)
    end
  end
  context 'New question' do
    it 'will appear on the home page when posted' do
      visit root_path
      fill_in('Title', :with => 'Dry skin') 
      fill_in('Content', :with => 'I have dry skin. What do I do?')
      click_on('Create Question')
      expect(current_path) == questions_path
      expect(page).to have_content('Dry skin')
    end
  end
end