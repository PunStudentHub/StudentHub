class Club < ApplicationRecord
  has_many :events
  has_and_belongs_to_many :users
  validates :name,  presence: true,
                    length: {maximum: 140}
  validates :description, presence: true,
                          length: {maximum: 1500}

end
