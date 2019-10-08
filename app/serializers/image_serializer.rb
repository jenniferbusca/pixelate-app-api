class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user, :title, :image, :bytes
  belongs_to :user
end
