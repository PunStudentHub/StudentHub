class Subject < ApplicationRecord
  include Friendlyable
  has_and_belongs_to_many :timeslots, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  default_scope { order(:name)}

end
