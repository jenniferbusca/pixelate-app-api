class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user, :image_url, :transformations
  belongs_to :user
end
