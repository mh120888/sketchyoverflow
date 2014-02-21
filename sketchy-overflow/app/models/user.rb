class User < ActiveRecord::Base
  attr_accessible :name, :password
  validates_presence_of :name, :password

  def self.authenticate(credentials)
    User.find_by_name_and_password(credentials[:username], credentials[:password])
  end

end