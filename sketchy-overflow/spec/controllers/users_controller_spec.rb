require 'spec_helper'

describe UsersController do
  let(:user) { FactoryGirl.create(:user) }

  context "#show" do
    before(:each) do
      get :show, id: user.id
    end

    it "should be ok" do
      expect(response).to be_success
    end

    it "should show the user" do
      expect(assigns(:user)).to eq User.find(user.id)
    end
  end

  context "#new" do
    before(:each) do
      get :new
    end

    it "should be ok" do
      expect(response).to be_success
    end

    it "should make a new user" do
      expect(assigns(:user).class).to eq User
    end
  end

  context "#create" do
    let(:params) { FactoryGirl.attributes_for(:user) }

    it "should create a user with vaild info" do
      expect {
        post :create, user: params
      }.to change { User.count }.by(1)
      expect(response).to be_redirect
    end

  end
end