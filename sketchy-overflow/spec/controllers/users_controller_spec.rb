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

    it 'should display all the user\'s questions' do
      new_question = Question.create(title: 'New question', content: 'new content', user_id: user.id)
      expect(assigns(:questions).last).to eq new_question
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

    it "should not create with an invalid password info" do
      invalid = {name: "a", password: "a"}
      expect {
        post :create, user: invalid
      }.to_not change { User.count }
      expect(response).to be_success
    end

    it "should not create duplicate users" do
      pending
    end
  end
end