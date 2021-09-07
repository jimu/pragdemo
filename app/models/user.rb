class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :name, uniqueness: true
  validates :avatar_url, allow_blank: true, format: { with: /.(gif|jpg|png)\z/i, message: 'must be a URL for GIF, JPG or PNG image.' }
end
