class Merchandise < ApplicationRecord
  has_one_attached :photo

  scope :by_price, -> { order(:price) }
  scope :by_name, -> { order(:name) }
  scope :below_price, ->(price) { where(price: 0...price) }
end
