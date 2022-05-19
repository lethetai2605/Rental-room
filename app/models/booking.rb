class Booking < ApplicationRecord
  # belongs_to :host, class_name: 'Account'
  belongs_to :guest, class_name: 'Account', foreign_key: "account_id"
  belongs_to :room
end
