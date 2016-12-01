class Product < ApplicationRecord
  belongs_to :sub_category
  has_many :images, dependent: :destroy

  scope :recent, -> {order("created_at DESC")}

  def self.for_select
    self.all.collect {|x| [x.name, x.id]}
  end
end
