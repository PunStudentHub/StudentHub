class User < ApplicationRecord
  has_many :microposts
  attr_accessor :remember_token, :activation_token
  before_save :downcase_email 
  before_create :create_activation_digest

  validates :name, presence: true,
                   length: {maximum: 50}

  validates :email, presence: true,
                    length: {maximum: 255},
                    format: { with: /\A[\w+\-.]+@punahou\.edu/i },
                    uniqueness: { case_sensitive: false }

  validates :password, presence: true,
                       length: {minimum: 8},
                       allow_nil: true
                       
  has_secure_password


  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  private

    def downcase_email
      self.email = email.downcase
    end

    def create_activation_digest
      #self.activation_token = User.new_token
      #self.activation_token = User.digest(activation_token)
    end



end
