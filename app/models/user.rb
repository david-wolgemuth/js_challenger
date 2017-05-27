class User < ApplicationRecord
  has_secure_password
  
  validates :username,
            presence: true,
            format: { with: /\A[a-zA-Z0-9_-]+\z/, message: 'Must not contain spaces or special characters (`-` and `_` permitted)'},
            uniqueness: true
  
  validates :email,
            allow_blank: true,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },  # Email Regex taken from http://api.rubyonrails.org/classes/ActiveModel/Validations/ClassMethods.html
            uniqueness: true
  
  def self.authenticate(creds)
    email_or_username = creds[:username_email]
    
    if email_or_username == ''
      return
    end
    
    user = self.find_by_email(email_or_username) || self.find_by_username(email_or_username)
    if user.nil?
      return
    end
    
    user.authenticate(creds[:password])
  end
  
end
