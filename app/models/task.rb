class Task < ApplicationRecord
  include Friendlyable
  has_many :taskees
  has_many :users, :through => :taskees
  has_and_belongs_to_many :sections
  validates :name, presence: true,
                   length: {maximum: 50}
  validates :description, length: {maximum: 200}
  scope :unfinished, -> {where(!task.taskees.find_by(user_id: current_user.id).completed?)}
  scope :finished, -> {where(task.taskees.find_by(user_id: current_user.id).completed?)}
end
