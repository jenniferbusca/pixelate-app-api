class User < ApplicationRecord
  has_many :images, :order => 'created_at DESC'
  mount_uploader :image, ImageUploader
end
