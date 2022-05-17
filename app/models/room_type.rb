class RoomType < ApplicationRecord
  belongs_to :room, optional: true
end
