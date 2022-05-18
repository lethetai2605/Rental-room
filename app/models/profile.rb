class Profile < ApplicationRecord
  belongs_to :account
  enum gender: {
    unknow: 0,
    male: 1,
    female: 2
  }
end
