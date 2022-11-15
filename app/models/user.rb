class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :superpowers
  has_many :bookings
  validates :username, presence: true, uniqueness: true, length: { maximum: 15 }
end
