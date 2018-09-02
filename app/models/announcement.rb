class Announcement < ApplicationRecord
  include Friendlyable
  belongs_to :user, dependent: :destroy
  has_and_belongs_to_many :class_years, dependent: :destroy
  validates :user_id, presence: true
  default_scope -> { order(updated_at: :desc) }
  validates :content, presence: true, length: {maximum: 10000}
  validates :title, presence: true, length: {maximum: 140}


end
