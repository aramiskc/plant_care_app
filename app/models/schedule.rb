class Schedule < ApplicationRecord
  belongs_to :plant
  belongs_to :user
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_after_start_time
  validate :within_time_limit

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    if end_time < start_time
      errors.add(:end_time, "must be after the start time")
    end
  end

  def within_time_limit
    return if end_time.blank? || start_time.blank?

    if end_time - start_time > 240.minutes
      errors.add(:end_time, "must be within an hour of the start time")
    end
  end
end
