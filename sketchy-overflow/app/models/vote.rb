class Vote < ActiveRecord::Base
  attr_accessible :user_id, :question_id, :value, :answer_id
  validates_uniqueness_of :user_id, :scope => [:question_id, :answer_id]
end