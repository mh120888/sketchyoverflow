require 'spec_helper'

describe Answer do
  context "columns" do
    it { should respond_to :content }
  end

  context "associations" do
    it { should belong_to :question }
  end

  context "validations" do
    it { should validate_presence_of :content}
  end
end