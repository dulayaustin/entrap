class Product < ApplicationRecord
  belongs_to :sub_category
  has_one :category, through: :sub_category, source: :category
  has_many :images, dependent: :destroy, inverse_of: :product
  has_many :stocks, dependent: :destroy, inverse_of: :product
  # has_many :sizes, through: :sub_category, source: :sizes 
  has_many :sizes, through: :stocks, source: :size

  accepts_nested_attributes_for :stocks

  # validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  
  scope :recent, -> {order("created_at DESC")}

  
end
