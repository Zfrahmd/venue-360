class Inquiry < ApplicationRecord
  belongs_to :user

  validates :first_name, :email, :words, presence: true

  def user_name
    return self.first_name + " " + self.last_name
  end
end
