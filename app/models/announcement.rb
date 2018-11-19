class Announcement < ApplicationRecord

  include Friendlyable
  include Filterable
  include Approvable

  belongs_to :user
  has_and_belongs_to_many :class_years, dependent: :destroy
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true, length: {maximum: 10000}
  validates :title, presence: true, length: {maximum: 140}

  #scope :approved_announcements, -> {where(approved: true)}

  def next user
    Announcement.filter_class_years(user).where("announcements.created_at > ?", created_at).where(approved: true).last
  end

  def prev user
    Announcement.filter_class_years(user).where("announcements.created_at < ?", created_at).where(approved: true).first
  end
  
end
