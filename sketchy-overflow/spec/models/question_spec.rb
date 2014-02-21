require 'spec_helper'

describe Question do
  context "columns" do
    it { should respond_to :content }
    it { should respond_to :title }
  end

  context "associations" do
    it { should belong_to :user }
    it { should have_many :answers }
  end

  context "#answers_by_create_date" do
    let!(:question) { FactoryGirl.create :question }
    let!(:answer) { FactoryGirl.create :answer, question: question }
    let!(:answer2) { FactoryGirl.create :answer, question: question }
    it "returns an an array of associated answers ordered by created_at" do
      expect(question.answers_by_create_date.first).to eq answer2
    end
  end
end