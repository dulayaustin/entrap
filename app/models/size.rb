class Size < ApplicationRecord
  has_many :sub_category_sizes
  # has_many :sub_categories, through: :sub_category_sizes, source: :sub_category
  has_many :stocks

end
