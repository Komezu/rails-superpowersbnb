class Superpower < ApplicationRecord
  belongs_to :user
  has_many :bookings

  CATEGORIES = %w(transformation superhuman elemental imperceptible others)
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :price_per_day, presence: true, numericality: { only_integer: true, minimum: 1 }
  validates :listed, inclusion: [true, false]
end
