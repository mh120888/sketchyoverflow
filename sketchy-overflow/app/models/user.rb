class User < ActiveRecord::Base
  attr_accessible :name, :password
  validates_presence_of :name, :password
  validates :name, uniqueness: true
  validates :password, length: { minimum: 8 }

  def self.authenticate(credentials)
    User.find_by_name_and_password(credentials[:username], credentials[:password])
  end

end