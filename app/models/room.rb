class Room < ApplicationRecord
  belongs_to :owner, class_name: "Account", foreign_key: "account_id"
  has_one :room_detail
  belongs_to :room_type
  has_many :bookings 
  has_many :bookers, through: :bookings, source: :account
end
