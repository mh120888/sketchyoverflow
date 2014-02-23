require 'spec_helper'

describe "Voting" do
  let!(:question) { Question.create(title: 'This is a question', user_id: 1) } 
  it 'an authenticated user can vote on a question' do
    create_user_and_login
    click_on('This is a question')
    click_on('Upvote')
    expect(current_path) == create_votes_path
  end
end