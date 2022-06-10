# frozen_string_literal: true

class RoomType < ApplicationRecord
  has_many :rooms
end
