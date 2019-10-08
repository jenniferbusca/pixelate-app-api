class Image < ApplicationRecord
  # attr_accessible :user, :title, :bytes, :image, :image_cache

  belongs_to :user

  # mount_uploader :image, ImageUploader

  # validates_presence_of :title, :image
end
