class Vote < ActiveRecord::Base
  attr_accessible :user_id, :question_id, :value
  validates_uniqueness_of :user_id, :scope => [:question_id]

  def self.has_this_user_voted?(user, question)
    (question.votes.select {|vote| vote.user_id == user.id}).length > 0
  end
end