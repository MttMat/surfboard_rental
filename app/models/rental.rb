class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :surfboard
  validates :starting_date, :return_date, presence: true, availability: true
  validate :return_date_after_starting_date
  validates :booking_status, presence: true
end
