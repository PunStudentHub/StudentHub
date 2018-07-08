class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :name, presence: true,
                   length: {maximum: 50}

  validates :email, presence: true,
                    length: {maximum: 255},
                    format: { with: /\A[\w+\-.]+@punahou\.edu/i },
                    uniqueness: { case_sensitive: false }

  validates :password, presence: true,
                       length: {minimum: 8}
                       
  has_secure_password
end
