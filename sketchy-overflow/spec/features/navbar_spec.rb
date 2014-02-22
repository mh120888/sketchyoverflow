require 'spec_helper'

describe "navbar" do
  context "user is not signed in" do
    it "displays a login and signup link" do
      visit root_path
      expect(page).to have_content "Login"
      expect(page).to have_content "Sign Up"
    end
  context "user is signed in" do
    it "displays a logout link" do
      create_user_and_login
      expect(page).to have_content "Signout"
    end
  end
  end
end