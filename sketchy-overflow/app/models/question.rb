class Question < ActiveRecord::Base
  attr_accessible :title, :content
  belongs_to :user
  has_many :answers

  def answers_by_create_date
    (self.answers.sort_by { |answer| answer.created_at }).reverse
  end
end