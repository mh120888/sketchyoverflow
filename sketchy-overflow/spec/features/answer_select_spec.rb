require 'spec_helper'
require_relative 'helper_methods'

describe "Logged in user", js:true do
  include Helpers
  let!(:user_attr) {FactoryGirl.attributes_for(:user)}

  it "should be able to see which questions are owned" do
    user = create_and_login(user_attr)
    title = "this is title"
    content = "this is content"
    post_question(title, content)
    wait_for_ajax
    expect(page).to have_content title
    expect(page).to have_content content
    expect(page).to have_css ".user-owned"
  end

  context "owned question page" do
    context "answer" do
      it "should have a best answer option" do
        user = create_and_login(user_attr)
        title = "this is title"
        content = "this is content"
        post_question(title, content)
        wait_for_ajax
        click_link title
        wait_for_ajax
        answer = "this is answer"
        fill_in 'answer_content', with: answer
        click_button('Create Answer')
        wait_for_ajax
        expect(page).to have_content "Posted by"
        expect(page).to have_css "form.best-form"
      end
    end

    it "should be able to select best answer" do
      user = create_and_login(user_attr)
      title = "this is title"
      content = "this is content"
      post_question(title, content)
      wait_for_ajax
      click_link title
      wait_for_ajax
      answer = "this is answer"
      fill_in 'answer_content', with: answer
      click_button('Create Answer')
      wait_for_ajax
      expect(page).to have_content answer
      click_button "Best Answer"
      wait_for_ajax
      expect(page).to have_css ".best-answer"
      visit(current_path)
      expect(page).to have_css ".best-answer"
    end

    it "should have 0 or 1 best answer" do
      user = create_and_login(user_attr)
      title = "this is title"
      content = "this is content"
      post_question(title, content)
      wait_for_ajax
      click_link title
      wait_for_ajax
      answer = "this is answer"
      fill_in 'answer_content', with: answer
      click_button('Create Answer')
      wait_for_ajax
      expect(page).to have_content answer
      click_button "Best Answer"
      wait_for_ajax
      answer2 = "this is answer2"
      fill_in 'answer_content', with: answer
      click_button('Create Answer')
      wait_for_ajax
      page.should have_css('.best-answer', count: 1)
    end
  end

end