class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :icon
  validates :name, presence: true, length: { maximum: 50 }
  validates :nickname, presence: true, length: { maximum: 50 }
  validates :skills, presence: true, length: { maximum: 255 }
end
