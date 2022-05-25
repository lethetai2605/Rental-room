class Profile < ApplicationRecord
  belongs_to :account
  has_one_attached :avatar
  enum gender: {
    unknow: 0,
    male: 1,
    female: 2
  }
  validates :phone,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }
end
