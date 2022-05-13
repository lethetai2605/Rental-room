class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :providers
  has_one :role
  has_one :profile
  has_many :rooms, through: :bookings
  has_many :bookings
end
