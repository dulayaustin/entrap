class Category < ApplicationRecord
  has_many :sub_categories

  def self.for_select
    Category.all.collect {|x| [x.name, x.id]}
  end
end
