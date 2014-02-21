require 'spec_helper'

describe Question do
  context "columns" do
    it { should respond_to :content }
  end

  context "associations" do
    it { should belong_to :user }
    it { should have_many :answers }
  end
end