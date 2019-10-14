class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :icon
  validates :name, presence: true, length: { maximum: 50 }
  validates :nickname, presence: true, length: { maximum: 50 }
  validates :affiliation1, presence: true, length: { maximum: 50 }
  validates :affiliation2, length: { maximum: 50 }
  validates :githubID, presence: true, length: { maximum: 255 }
  validates :QiitaID, length: { maximum: 255 }
  validates :otherURL, length: { maximum: 255 }
  validates :skills, presence: true, length: { maximum: 255 }
end
