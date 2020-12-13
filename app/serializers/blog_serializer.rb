class BlogSerializer
  include JSONAPI::Serializer

  attributes :blog do |object|
    {
      title: object.title,
      content: object.content
    }
  end

  set_key_transform :camel_lower
end
