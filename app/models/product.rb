class Product < ApplicationRecord
  belongs_to :sub_category
  delegate :category, to: :sub_category
  has_many :images, dependent: :destroy

  
end
