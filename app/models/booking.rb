class Booking < ApplicationRecord
  # belongs_to :host, class_name: 'Account'
  belongs_to :guest, class_name: 'Account', foreign_key: "account_id"
  belongs_to :room
  enum status: {
    pending: 0,
    accept: 1,
    refuse: 2
  }
end
