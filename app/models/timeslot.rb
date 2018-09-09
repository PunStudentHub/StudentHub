class Timeslot < ApplicationRecord
  has_and_belongs_to_many :subjects, dependent: :destroy
  validates :day, presence: true,
                    numericality: {
                                    only_integer: true,
                                    less_than_or_equal_to: 5,
                                    greater_than_or_equal_to: 0 }
  validates :time,  presence: true,
                    numericality: {
                                    only_integer: true,
                                    less_than_or_equal_to: 7,
                                    greater_than_or_equal_to: 0 }
end
