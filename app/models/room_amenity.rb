class RoomAmenity < ApplicationRecord
  belongs_to :room
  belongs_to :amenity
  
  validates :room_id, uniqueness: { scope: :amenity_id }
end