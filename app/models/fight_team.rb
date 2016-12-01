class FightTeam < ApplicationRecord
  has_attached_file :picture, styles: { thumb: "150x150>", large: "400x400>" }, default_url: "/images/:style/missing.png"
  validates_attachment :picture, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }, presence: true

end
