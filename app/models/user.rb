class User < ApplicationRecord
  include Friendlyable

  has_many :announcements, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :blog_posts, dependent: :destroy
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :events
  has_and_belongs_to_many :class_years
  attr_accessor :remember_token, :activation_token
  before_save :downcase_email
  default_scope -> {order(:created_at)}
#  before_create :create_activation_digest

  validates :name, presence: true,
                   length: {maximum: 50}

  validates :email, presence: true,
                    length: {maximum: 255},
                    format: { with: /\A[\w+\-.]+@punahou\.edu/i },
                    uniqueness: { case_sensitive: false }


  def self.get_color rank
    colors[rank]
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def find_classyear
    number_index = (email =~ /[0-9]{2}/)
    ClassYear.find(email.split("")[number_index..number_index+1].join.to_i + 2000)
  end

  class << self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

#  def send_activation_email
#    UserMailer.account_activation(self).deliver_now
#  end

  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  def forget
      update_attribute(:remember_digest, nil)
  end

  def redirect_stuff
    redirect_to root_url
  end

  def can_do permission
    self.roles.map {|r| r.send(permission)}.include?(true)
  end

  def smart_class_years
    self.class_years if self.class_years.any?
    ClassYear.all
  end


  def smart_class_year_ids
    smart_class_years.map { |c| c.id.to_s }
  end

  private

    def save_classyears
      self.class_years = [find_classyear]
    end
  
    def downcase_email
      self.email = email.downcase
    end

    def create_activation_digest
      self.activation_token = User.new_token
      self.activation_digest = User.digest(activation_token)
    end

    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        if user.valid?
          user.save!
        end
      end
  end
end
