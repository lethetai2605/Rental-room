class RoomDetail < ApplicationRecord
  belongs_to :room

  validates :startday, presence: true
  validates :endday, presence: true
  validate :check_dates
  def check_dates
    errors.add(:endday, "should be greater than Start day") if self.startday > self.endday
    errors.add(:checkout, "should be greater than Check in") if self.checkin > self.checkout
  end
end
