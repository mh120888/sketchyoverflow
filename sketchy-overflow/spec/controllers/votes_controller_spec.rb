require 'spec_helper'

describe VotesController do
  context '#create' do
    it 'should create a new instance of vote' do
      expect {
        @request.env['HTTP_REFERER'] = '/questions/1'
        post :create, vote: Vote.new
      }.to change {Vote.count }.by(1)
    end
  end
end