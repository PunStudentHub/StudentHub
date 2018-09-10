class Subject < ApplicationRecord
  include Friendlyable
  has_and_belongs_to_many :timeslots, dependent: :destroy
  validates :name, presence: true
end
