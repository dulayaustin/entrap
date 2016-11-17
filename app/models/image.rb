class Image < ApplicationRecord
  has_attached_file :image, styles: { medium: "320x320>", thumb: "60x60>", large: "600x600>" }, default_url: "/images/:style/missing.png"
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }, presence: true

  belongs_to :product
end
