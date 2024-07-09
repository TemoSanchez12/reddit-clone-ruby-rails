class User < ApplicationRecord
  has_secure_password  # Requiere 'bcrypt' gem

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }

  has_many :subreddits, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
