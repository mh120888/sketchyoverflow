require 'spec_helper'

describe User do

  it { should have_many :questions }

  context "#authenticate" do
    it "should find existing user" do
      user = User.create(name: "foo", password: "bar")
      expect(User.authenticate({username: user.name, password: user.password}).class).to be User
    end

    it "should be false if not found" do
      expect(User.authenticate({})).to be_nil
    end
  end
end