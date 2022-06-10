# frozen_string_literal: true

class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  has_many :providers
  belongs_to :role
  has_one :profile
  has_many :bookings
  has_many :rooms, through: :bookings

  def self.from_omniauth(auth)
    result = User.where(email: auth.info.email).first
    return result if result

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.fullname = auth.info.name
      user.image = auth.info.image
      user.uid = auth.uid
      user.provider = auth.provider
      #  If you are using confirmable and the provider(s) you use validate emails
      user.skip_confirmation!
    end
  end

  def admin?
    role.name == 'Admin' unless role.nil?
  end

  def host?
    role.name == 'Host' unless role.nil?
  end

  def guest?
    role.name == 'Guest' unless role.nil?
  end
end
