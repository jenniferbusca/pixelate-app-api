class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user, :image_url
  belongs_to :user
end
