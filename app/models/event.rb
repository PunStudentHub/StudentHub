class Event < ApplicationRecord
  include Friendlyable
  belongs_to :user, dependent: :destroy
  belongs_to :event, optional: true
  default_scope -> { order('start_time ASC') }
  validates :title, presence: true, length: {maximum: 50}
  validates :user_id, presence: true
  validates :location, presence: true, length: {maximum: 140}
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :ends_after_start
  validate :date_in_future
  has_and_belongs_to_many :users

  scope :approved_events, -> {where(approved: true)}
  scope :today, -> { where(start_time: DateTime.now.beginning_of_day..DateTime.now.end_of_day) }
  scope :tomorrow, -> { where(start_time: (DateTime.now.beginning_of_day + 1.day)..(DateTime.now.end_of_day + 1.day)) }
  scope :day_after_tomorrow, -> { where(start_time: (DateTime.now.beginning_of_day + 2.days)..(DateTime.now.end_of_day + 2.days)) }

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
