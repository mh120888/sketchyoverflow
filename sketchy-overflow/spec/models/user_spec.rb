require 'spec_helper'

describe User do

  context "#authenticate" do
    it "should find existing user" do
      user = User.create(name: "foo", password: "bar")
      expect(User.authenticate({name: user.name, password: user.password})).to be true
    end

    it "should be false if not found"
  end
end