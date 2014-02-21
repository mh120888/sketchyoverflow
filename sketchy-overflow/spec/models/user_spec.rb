require 'spec_helper'

describe User do

  context "#authenticate" do
    let(:user) { FactoryGirl.create(:user) }
    it "should find existing user" do
      expect(User.authenticate({username: user.name, password: user.password}).class).to be User
    end

    it "should be false if not found" do
      expect(User.authenticate({})).to be_nil
    end
  end
end