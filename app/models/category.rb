class Category < ApplicationRecord
  has_many :products

  def self.for_select
    Category.all.collect {|x| [x.name, x.id]}
  end
end
