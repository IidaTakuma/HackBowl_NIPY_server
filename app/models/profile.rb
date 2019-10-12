class Profile < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 50 }
  validates :nickname, presence: true, length: { maximum: 50 }
  validates :icon_path, presence: true
  validates :skills, presence: true, length: { maximum: 255 }
end
