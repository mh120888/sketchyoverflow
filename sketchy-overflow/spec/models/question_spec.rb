require 'spec_helper'

describe Question do
  let(:question) { FactoryGirl.create :question }
  it { should respond_to(title) }
end