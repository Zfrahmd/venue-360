class RoomImage < ApplicationRecord
  belongs_to :room
  
  # mount_uploader :image, RoomImageUploader
  
  validates :image_url, presence: true
end