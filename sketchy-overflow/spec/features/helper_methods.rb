require 'spec_helper'

module Helpers
  def create_and_login(user_attr)
    user = User.create(user_attr)
    visit new_session_path
    fill_in 'Username', :with => user_attr[:name]
    fill_in 'Password', :with => user_attr[:password]
    click_button "Login"
    user
  end

  def post_question(title, content)
    visit root_path
    fill_in('question_title', :with => title)
    fill_in('question_content', :with => content)
    click_on('Create Question')
  end
end