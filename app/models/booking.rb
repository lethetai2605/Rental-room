# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :guest, class_name: 'Account', foreign_key: 'account_id'
  belongs_to :room
  validate :end_must_be_after_start

  scope :specific_month, ->(month) { where(startday: Date.new(Time.now.year, month).beginning_of_month..Date.new(Time.now.year, month).end_of_month) }

  def end_must_be_after_start
    if startday >= endday
      errors.add(:startday, 'must be after start time')
    end
  end
  enum status: {
    pending: 0,
    accept: 1,
    refuse: 2
  }
end
