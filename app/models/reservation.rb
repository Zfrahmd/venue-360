class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user
  
  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validates :adults, presence: true, 
                     numericality: { 
                       only_integer: true, 
                       greater_than: 0,
                       less_than_or_equal_to: ->(reservation) { reservation.room.capacity }
                     }
  validates :children, presence: true,
                       numericality: {
                         only_integer: true,
                         greater_than_or_equal_to: 0
                       }
  validate :check_out_after_check_in
  validate :room_available
  validate :total_guests_within_capacity
  
  before_save :calculate_total_price
  
  enum status: { pending: 0, confirmed: 1, cancelled: 2, completed: 3 }
  
  def self.booked_between(check_in, check_out)
    where("check_in_date < ? AND check_out_date > ?", check_out, check_in)
  end
  
  def total_guests
    adults + children
  end
  
  private
  
  def check_out_after_check_in
    return if check_out_date.blank? || check_in_date.blank?
    
    if check_out_date <= check_in_date
      errors.add(:check_out_date, "must be after check-in date")
    end
  end
  
  def room_available
    return if room.blank? || check_in_date.blank? || check_out_date.blank?
    
    if room.reservations.booked_between(check_in_date, check_out_date).where.not(id: id).exists?
      errors.add(:room, "is already booked for the selected dates")
    end
  end
  
  def total_guests_within_capacity
    return if room.blank? || adults.blank? || children.blank?
    
    if total_guests > room.capacity
      errors.add(:base, "Total guests (adults + children) cannot exceed room capacity of #{room.capacity}")
    end
  end
  
  def calculate_total_price
    nights = (check_out_date - check_in_date).to_i
    self.total_price = room.price_per_night * nights
  end
end