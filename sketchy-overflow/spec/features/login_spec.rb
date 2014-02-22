require 'spec_helper'

describe "login" do
  context "can see a login page" do
    it "should have login contents" do
      visit new_session_path
      expect(page).to have_content("login")
    end
  end

  context "can login" do
    it "should be able to log in" do
      pending
    end

    it "should store user id" do
      pending
    end

  end
end



