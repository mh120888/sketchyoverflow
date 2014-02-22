require 'spec_helper'
require_relative 'helper_methods'

describe "Logged in user" do
  include Helpers
  let!(:user_attr) {FactoryGirl.attributes_for(:user)}

  it "should be able to see which questions are owned" do
    user = create_and_login(user_attr)
    title = "this is title"
    content = "this is content"
    post_question(title, content)
    expect(page).to have_content title
    expect(page).to have_content content
    expect(page).to have_content "Your question"
  end

  it "should not own questions they did not make"

  context "owned question page" do
    it "should be able to select best answer"

    it "should have 0 or 1 best answer"
  end

end