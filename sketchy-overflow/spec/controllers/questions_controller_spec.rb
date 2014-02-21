require 'spec_helper'

describe QuestionsController do
  context '#index' do
    it "assigns all questions to @questions" do
      get :index
      expect(assigns(:questions)).to eq Question.all
    end
  end

  context '#new' do
    it 'creates a new instance of Question' do
      pending
    end
    it 'renders the #new template' do
      pending
    end
  end

  context '#create' do
    context 'valid params' do
      it 'saves a question to the database' do
        pending
      end
      it 'redirects the user to the root path' do
        pending
      end
      it 'creates a flash notice for the user advising post succeeded' do
        pending
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