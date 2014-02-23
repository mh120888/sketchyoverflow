class Answer < ActiveRecord::Base
  attr_accessible :content, :question_id, :best
  belongs_to :question
  has_many :votes
  validates :content, presence: true

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