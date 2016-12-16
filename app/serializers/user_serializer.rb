class UserSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :user_type, :email, :token
end
