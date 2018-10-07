class Task < ApplicationRecord
  has_many :taskees
  has_many :users, :through => :taskees
  has_and_belongs_to_many :sections
  validates :name, presence: true,
                   length: {maximum: 50}
  validates :description, length: {maximum: 200}
end
