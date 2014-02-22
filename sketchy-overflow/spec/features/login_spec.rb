require 'spec_helper'

describe "login" do
  context "can see a login page" do
    it "should have login contents" do
      visit new_session_path
      expect(page).to have_content("login")
    end
  end

  context "can login" do
    let!(:user) { User.create(name: 'bob', password: 'test1234') } 
    it "should create session" do
      visit new_session_path
      fill_in 'Username', :with => 'bob'
      fill_in 'Password', :with => 'test1234'
      click_button "Login"
      user.reload
      expect(page).to have_content user.name.slice(0,8)
    end

    it "should store user id" do
      pending
    end

  end
end



