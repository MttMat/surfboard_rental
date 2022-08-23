class Surfboard < ApplicationRecord
  belongs_to :user
  validates :price, presence: true
  validates :lenght, presence: true
  validates :address, presence: true
  validates :material_type, presence: true
  validates :brand, presence: true
  validates :shape, presence: true
  validates :description, presence: true, length: { in: 15..40 }
end
