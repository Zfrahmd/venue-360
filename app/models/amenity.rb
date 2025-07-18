class Amenity < ApplicationRecord
  has_many :room_amenities
  has_many :rooms, through: :room_amenities
  
  validates :name, presence: true, uniqueness: true
  validates :icon_class, presence: true, uniqueness: true
  validates :description, presence: true
end