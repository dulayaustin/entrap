class SubCategory < ApplicationRecord
  has_many :products
  belongs_to :category

  has_many :sub_category_sizes
  has_many :sizes, through: :sub_category_sizes, source: :size
  
end
