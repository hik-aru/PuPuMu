class User < ApplicationRecord
  has_secure_password

  validates :email,
    presence: true,
    uniqueness: true,
    length: { maximum: 16 },
    format: {
      with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
      message: 'が不正な形式です'
    }
  validates :password,
    length: { minimum: 8}
end
