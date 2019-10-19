class User < ApplicationRecord
  has_secure_token

  has_one :profile
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: true }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  has_many :following_friendships, foreign_key: 'follower_id', class_name: 'Friendship', dependent: :destroy
  has_many :followings, through: :following_friendships

  has_many :follower_friendships, foreign_key: 'following_id', class_name: 'Friendship', dependent: :destroy
  has_many :followers, through: :follower_friendships

  def new_token
    SecureRandom.urlsafe_base64
  end
end
