class Taskee < ApplicationRecord
  has_and_belongs_to_many :tasks
  belongs_to :doer, polymorphic: true
  validates :doer_id, uniqueness: { scope: :doer_type }
end
