class Product < ApplicationRecord
  belongs_to :sub_category
  has_many :images, dependent: :destroy

  scope :recent, -> {order("created_at DESC")}
end
