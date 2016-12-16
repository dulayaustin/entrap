class Review < ApplicationRecord
  belongs_to :product

  default_scope {order("created_at DESC")}
end
