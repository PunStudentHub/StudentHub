class Section < ApplicationRecord
  has_and_belongs_to_many :users
  has_one :taskee, as: :doer
end
