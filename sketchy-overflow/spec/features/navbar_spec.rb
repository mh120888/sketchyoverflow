require 'spec_helper'

describe "navbar" do
  context "user is not signed in" do
    it "displays a login and signup link" do
      visit root_path
      expect(page).to have_content "Login"
      expect(page).to have_content "Sign Up"
    end
  context "user is signed in" do
    let!(:user) { User.create(name: 'bob', password: 'test1234') } 
    it "displays a logout link" do
      visit new_session_path
      fill_in 'Username', :with => 'bob'
      fill_in 'Password', :with => 'test1234'
      click_button "Login"
      visit root_path
      expect(page).to have_content "Signout"
    end
  end
  end
end