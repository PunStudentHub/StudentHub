class BlogPost < ApplicationRecord
  include Friendlyable
  belongs_to :user
  validates :title, presence: true, length: {maximum: 10000}
  validates :content, presence: true, length: {maximum: 10000}
  validates :user_id, presence: true
  default_scope -> {order(created_at: :desc)}


  def to_partial_path
    "blog/blog_post"
  end

end
