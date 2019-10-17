class User < ApplicationRecord
  has_many :images, -> { order('created_at DESC')}
  validates :email, :password, presence: true
  validates :email, uniqueness: { case_sensitive: false }, on: :create
end
