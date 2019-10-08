class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :password
  has_many :images
end
