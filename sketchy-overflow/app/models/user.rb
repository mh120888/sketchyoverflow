class User < ActiveRecord::Base
  has_many :questions
  attr_accessible :name, :password
  validates_presence_of :name, :password
  validates :name, uniqueness: true
  validates :password, length: { minimum: 8 }

  before_validation :hash_username!
  before_save :encrypt_password!

  def self.authenticate(credentials)
    credentials[:username] ||= ""
    user = User.find_by_name Digest::SHA512.hexdigest(credentials[:username])
    if user
      user if SCrypt::Password.new(user.password) == credentials[:password]
    end
  end

  private
  def encrypt_password!
    self.password = SCrypt::Password.create(
      self.password, 
      key_len: 512, 
      salt_size: 32, 
      max_time: 2, 
      max_mem: 0, 
      max_memfrac: 0.5)
  end

  def hash_username!
    self.name = Digest::SHA512.hexdigest(self.name)
  end
end