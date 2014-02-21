require 'spec_helper'

describe "Create User" do
  context "user page" do
    before(:each) do
      visit new_user_path
    end
    it "should be ok" do
      expect(page).to have_content "New User"
    end

    it "should have a new user form" do
      expect(page).to have_content "User"
      expect(page).to have_content "Password"
    end

    it "should create user with valid info" do
      fill_in "Name", with: "Test User"
      fill_in "Password", with: "password123"
      click_button "Create User"
      expect(page).to have_content "Test User"
      expect(page).to have_content "User Page"
    end
  end

end