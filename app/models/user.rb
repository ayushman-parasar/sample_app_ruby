class User < ApplicationRecord
  
  
  before_save  {self.email = email.downcase}
  Valid_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence:true, length:{maximum:50}
  validates :email, presence:true, length:{maximum:225},
  format:{with: Valid_regex}, 
  uniqueness: { case_sensitive: false }
  validates :password, presence:true, length:{minimum: 6}
  has_secure_password
end
