class Vote < ActiveRecord::Base
  attr_accessible :user_id, :question_id, :value
  validates_uniqueness_of :user_id, :scope => [:question_id]
end