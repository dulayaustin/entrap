class Review < ApplicationRecord
  belongs_to :product

  scope :recent, -> {order("created_at DESC")}
end
