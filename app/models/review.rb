class Review < ApplicationRecord
  belongs_to :product, counter_cache: true

  default_scope {order("created_at DESC")}
end
