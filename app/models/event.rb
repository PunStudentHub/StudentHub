class Event < ApplicationRecord
  include Friendlyable
  include Filterable
  include ApprovableModel

  belongs_to :user, dependent: :destroy
  belongs_to :club, optional: true
  default_scope -> { order('start_time ASC') }
  validates :title, presence: true, length: {maximum: 50}
  validates :user_id, presence: true
  validates :location, presence: true, length: {maximum: 140}
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :ends_after_start
  validate :date_in_future
  has_and_belongs_to_many :users

  scope :finalized, -> { where(final: true) }
  scope :today, -> { where(start_time: DateTime.now.getlocal('-10:00').beginning_of_day..DateTime.now.getlocal('-10:00').end_of_day) }
  scope :tomorrow, -> { where(start_time: (DateTime.now.getlocal('-10:00').beginning_of_day + 1.day)..(DateTime.now.getlocal('-10:00').end_of_day + 1.day)) }
  scope :day_after_tomorrow, -> { where(start_time: (DateTime.now.getlocal('-10:00').beginning_of_day + 2.days)..(DateTime.now.getlocal('-10:00').end_of_day + 2.days)) }
  scope :future_events, -> { where("start_time > ?", DateTime.now.getlocal('-10:00')) }
  scope :past_events, -> { where("start_time < ?", DateTime.now.getlocal('-10:00')) }
  scope :future_day_events, -> { where("start_time > ?", DateTime.now.getlocal('-10:00').beginning_of_day) }
  scope :set_day_events, -> (day) { where(start_time: day.beginning_of_day..day.end_of_day)}
  scope :by_user, -> (user) {
    joins(:users).where(users: {id: user})
  }

  def ends_after_start
    if (end_time < start_time)
      errors.add(:end_time, 'must be after the start time')
    end
  end

  def next user
    Event
        .where("start_time < ?", start_time)
        .where(approved: true)
        .future_events
        .last
  end

  def prev user
    Event
        .where("start_time > ?", start_time)
        .where(approved: true)
        .future_events
        .first
  end

  def past?
    start_time < Time.zone.now
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
