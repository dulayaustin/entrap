class Product < ApplicationRecord
  has_attached_file :image, styles: { medium: "320x320>", thumb: "320x150>" }, default_url: "/images/:style/missing.png"
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  belongs_to :category

end
