class User < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest

  def generate_auth_token
    SecureRandom.hex(10)
  end
end