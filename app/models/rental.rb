class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :surfboard
  validates :starting_date, :return_date, presence: true
  validate :return_date_after_starting_date
  validates :booking_status, presence: true

  private

  def return_date_after_starting_date
    return if return_date.blank? || starting_date.blank?

    if return_date < starting_date
      errors.add(:return_date, "must be after the start date")
    end
 end
end
