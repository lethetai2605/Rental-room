class Room < ApplicationRecord
  has_one :owner, class: "Account", foreign_key: "account_id"
  has_one :room_detail
  has_one :room_type
  has_many :bookings 
  has_many :rooms, through: :bookings
end
