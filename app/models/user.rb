class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum role: [:user, :manager, :admin]

  validates :first_name, presence: true
  after_initialize :set_default_user_type, if: :new_record?

  # set the default usertype
  def set_default_user_type
    self.user_type ||= :user
  end
end
