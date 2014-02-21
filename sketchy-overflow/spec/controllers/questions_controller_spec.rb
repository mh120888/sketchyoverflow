require 'spec_helper'

describe QuestionsController do
  context '#index' do
    it "assigns all questions to @questions" do
      get :index
      expect(assigns(:questions)).to eq Question.all
    end
  end

  context '#show' do
    let(:user) { FactoryGirl.create :user }
    let(:question) { FactoryGirl.create :question, user: user }
    let(:answer) { FactoryGirl.create :answer, question: question }
    it "assigns the question to @question" do
      get :show, id: question.id
      expect(assigns(:question)).to eq question
    end
    it "assigns question user to @user" do
      get :show, id: question.id
      expect(assigns(:user)).to eq question.user
    end
    it "assigns associated answers to @answers" do
      get :show, id: question.id
      expect(assigns(:answers)).to eq question.answers_by_create_date
    end
  end

  context '#new' do
    it 'creates a new instance of Question' do
      get :index
      expect(assigns(:question)).to be_an_instance_of Question
    end
  end

  context '#create' do
    let!(:question) { FactoryGirl.create :question }
    context 'valid params' do
      it 'saves a question to the database' do
        expect(Question.last.id).to eq(question.id)
      end
      it 'redirects the user to the root path' do
        pending
        expect(response).to redirect_to(root_path)
      end
      it 'creates a flash notice for the user advising post succeeded' do
        pending
        expect(flash[:notice]).to eq('Question successfully posted')
      end
    end
    context 'invalid params' do
      it 'does not save the question to the database' do
        pending
      end
      it 'renders the new template again' do
        pending
      end
      it 'creates a flash notice for the user advising post failed' do
        pending
      end
    end
  end
end