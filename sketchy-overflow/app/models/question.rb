class Question < ActiveRecord::Base
  attr_accessible :title, :content, :user_id
  belongs_to :user
  has_many :answers
  has_many :votes

  def answers_by_create_date
    (self.answers.sort_by { |answer| answer.created_at }).reverse
  end

  def upvotes
    self.votes.select {|vote| vote.value == 1}.count
  end

  def downvotes
    self.votes.select {|vote| vote.value == -1}.count
  end

  def calculate_net_votes
    upvotes - downvotes
  end
end