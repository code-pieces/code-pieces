class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :avatar_url, :email
end
