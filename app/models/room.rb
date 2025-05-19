class Room < ApplicationRecord
  has_many :room_amenities
  has_many :amenities, through: :room_amenities
  has_many :reservations
  has_many :room_images

  validates :room_number, presence: true, uniqueness: true
  validates :room_type, presence: true
  validates :price_per_night, presence: true, numericality: { greater_than: 0 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  
  enum :room_type, single: 0, double: 1, suite: 2, deluxe: 3

  accepts_nested_attributes_for :room_images

  scope :available_between, ->(check_in, check_out) {
    where.not(id: Reservation.booked_between(check_in, check_out).select(:room_id))
  }
end