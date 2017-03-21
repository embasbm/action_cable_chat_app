class Dialect < ApplicationRecord
  has_many :users
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_attached_file :icon, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\z/
end
