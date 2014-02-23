class Upvote < ActiveRecord::Base
  attr_accessible :user_id, :question_id
end