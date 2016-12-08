class Size < ApplicationRecord
  has_many :sub_category_sizes
  has_many :stocks

end
