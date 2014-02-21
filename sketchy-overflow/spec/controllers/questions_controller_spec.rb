require 'spec_helper'

describe QuestionsController do 
  describe '#new' do
    it 'creates a new instance of Question' do
      pending
    end
    it 'renders the #new template' do
      pending
    end
  end
  describe '#create' do
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