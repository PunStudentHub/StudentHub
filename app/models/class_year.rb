class ClassYear < ApplicationRecord
  has_and_belongs_to_many :announcements, dependent: :destroy
  has_and_belongs_to_many :users, dependent: :destroy
end
