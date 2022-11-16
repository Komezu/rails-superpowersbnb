class Booking < ApplicationRecord
  STATUSES = %w[accepted declined pending cancelled]

  belongs_to :user
  belongs_to :superpower

  validates :status, inclusion: { in: STATUSES }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates_comparison_of :start_date, greater_than_or_equal_to: Date.today
  validates_comparison_of :end_date, greater_than_or_equal_to: :start_date

  before_validation :set_to_pending

  private

  def set_to_pending
    self.status = status.nil? ? "pending" : status
  end
end
