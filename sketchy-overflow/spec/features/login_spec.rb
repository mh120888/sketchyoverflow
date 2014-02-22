require 'spec_helper'

describe "login" do
  context "can see a login page" do
    it "should have login contents" do
      visit new_session_path
      expect(page).to have_content("login")
    end
  end

  context "can login" do
    let!(:user) { FactoryGirl.create(:user) }
    it "should create session" do
      visit new_session_path
      fill_in 'Username', :with => user.name
      fill_in 'Password', :with => user.password
      click_button "Login"
      expect(page).to have_content user.name
    end

    it "should store user id" do
      pending
    end

  end
end



