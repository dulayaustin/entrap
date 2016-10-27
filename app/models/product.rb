class Product < ApplicationRecord
  has_attached_file :image, styles: { medium: "320x320>", thumb: "320x150>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :image, content_type: %r{\.(gif|jpg|png)\Z}i
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
