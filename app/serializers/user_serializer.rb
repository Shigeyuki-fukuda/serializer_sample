class UserSerializer
  include JSONAPI::Serializer
  attributes :user do |object|
    {
      name: object.name,
      email: object.email
    }
  end
end
