# frozen_string_literal: true

class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  has_many :providers
  belongs_to :role
  has_one :profile
  has_many :bookings
  has_many :rooms, through: :bookings

  def self.from_omniauth(auth)
    result = Account.where(email: auth.info.email).first
    if result
      return result
    else

        account = Account.new
        provider = auth.provider
        uid = auth.uid

        account.email = auth.info.email
        account.password = Devise.friendly_token[0,20]
        # account.fullname = auth.info.name
        # account.image = auth.info.image

        #  If you are using confirmable and the provider(s) you use validate emails
        account.save
        account.providers.find_or_create_by(uid: uid, name: provider)
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
