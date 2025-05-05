class Inquiry < ApplicationRecord
  belongs_to :user

  validates :first_name, :email, :words, presence: true

  def phone_exists
    self.phone.nil? ? "not available" : self.phone
  end

  def user_name
    return self.first_name + " " + self.last_name
  end
end
