class Event < ApplicationRecord
  include Friendlyable
  belongs_to :user, dependent: :destroy
  default_scope -> { order(start_time: :asc) }
  validates :title, presence: true, length: {maximum: 140}
  validates :user_id, presence: true
  validates :location, presence: true, length: {maximum: 140}
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :ends_after_start
  validate :date_in_future

  def ends_after_start
    if (end_time < start_time)
      errors.add(:end_time, 'must be after the start time')
    end
  end

  def date_in_future
    if (start_time < Time.zone.now)
      errors.add(:start_time, "must be in the future #{start_time}, #{Time.zone.now}")
    end

    if (end_time < Time.zone.now)
      errors.add(:end_time, 'must be in the future')
    end
  end
end
