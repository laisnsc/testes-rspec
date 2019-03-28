class Admin < ApplicationRecord
  #EMAIL_REGEX = "^[a-z]$"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, presence: true, length: { minimum: 8 }
  #validates :email, presence: true, format: {with: /\A[a-zA-Z0-9]+\z/}
  #Kaminari
  paginates_per 5
end
