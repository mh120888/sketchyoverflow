require 'spec_helper'

describe User do

  context "#authenticate" do
    it "should find existing user" do
      user = User.create(name: "foo", password: "bar")
      expect(User.authenticate({username: "foo", password: "bar"}).class).to be User
    end

    it "should be false if not found" do
      expect(User.authenticate({})).to be_nil
    end
  end

  describe "#encrypt_credentials!" do
    context "before saving to the database" do
      it "encrypts the user's password using SCrypt" do
        user = User.create(name: "bob", password: "test1234")
        user.reload
        expect(user.password).not_to eq("test1234")
        expect(SCrypt::Password.new(user.password)).to be_an_instance_of SCrypt::Password
      end
      it "hashes the user's username using SHA512" do
        user = User.create(name: "roger", password: "test1234")
        user.reload
        expect(user.name).not_to eq("roger")
        expect(user.name.length).to eq(128)
      end
    end
  end

end