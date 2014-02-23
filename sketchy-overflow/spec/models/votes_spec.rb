require 'spec_helper'

describe Vote do
  context "columns" do
    it { should respond_to :user_id }
    it { should respond_to :question_id}
    it { should respond_to :value }
    it { should respond_to :answer_id }
  end

  context "associations" do
    it { should belong_to :question }
    it { should belong_to :answer }
    it { should belong_to :user }
  end

  context "validations" do
    it { should validate_uniqueness_of(:user_id).scoped_to(:question_id, :answer_id)}
  end
end