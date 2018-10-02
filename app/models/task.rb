class Task < ApplicationRecord
  has_and_belongs_to_many :taskees
#  validates :taskee, presence: true
  validates :name, presence: true
end
