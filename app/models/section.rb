class Section < ApplicationRecord
  include Friendlyable
  has_and_belongs_to_many :users

end
