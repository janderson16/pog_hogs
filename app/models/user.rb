class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_secure_password
  # enum role: %w(default admin)
  enum({role: [:default, :admin]})
end
