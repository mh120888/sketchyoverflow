require 'spec_helper'

describe "login" do
  context "user can see a login page" do
    it "should have login contents" do
      visit new_session_path
      expect(page).to have_content("login")
    end

  end

  context "user can login" do
    let!(:user) { FactoryGirl.create(:user) }

    it "should create session" do
      visit new_session_path
      fill_in 'Username', :with => user.name
      click "Login"
    end

    it "should store user id" do

    end
  end
end



