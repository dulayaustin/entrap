class SubCategory < ApplicationRecord
  has_many :products
  belongs_to :category

  def self.for_select
    self.all.collect {|x| [x.name, x.id]}
  end
end
