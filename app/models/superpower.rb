class Superpower < ApplicationRecord
  CATEGORIES = %w[transformation superhuman elemental imperceptible others]

  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :price_per_day, presence: true, numericality: { only_integer: true, minimum: 1 }
  validates :listed, inclusion: [true, false]

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
