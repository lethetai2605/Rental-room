class Room < ApplicationRecord
  belongs_to :owner, class_name: "Account", foreign_key: "account_id"
  has_one :room_detail, dependent: :destroy
  belongs_to :room_type
  has_many :bookings 
  has_many :guests, through: :bookings, class_name: "Account"

  accepts_nested_attributes_for :room_detail

  validates :address, :name, presence: {message: "is require"}
  validates :area, :price, numericality: { only_decimal: true, greater_than_or_equal_to: 0 }
end
